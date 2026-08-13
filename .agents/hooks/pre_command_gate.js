/**
 * BDNSI Agentic Workflow — Pre-Tool Safety Gate
 * Runs BEFORE every run_command to:
 *  1. Block dangerous destructive commands
 *  2. Warn on migrate:fresh without backup
 *  3. Auto-log command audit trail
 */

const fs = require('fs');
const path = require('path');
const readline = require('readline');

const AUDIT_LOG = path.join(__dirname, '..', 'logs', 'command_audit.log');

// Ensure log dir exists
fs.mkdirSync(path.dirname(AUDIT_LOG), { recursive: true });

// Read stdin (hook payload)
const rl = readline.createInterface({ input: process.stdin });
let raw = '';
rl.on('line', line => (raw += line));
rl.on('close', () => {
  let payload;
  try { payload = JSON.parse(raw); } catch { payload = {}; }

  const cmd = (payload?.toolCall?.args?.CommandLine || '').trim();
  const ts  = new Date().toISOString();

  // --- Audit log ---
  fs.appendFileSync(AUDIT_LOG, `[${ts}] CMD: ${cmd}\n`);

  // --- Danger patterns ---
  const HARD_BLOCK = [
    /migrate:fresh\s+--seed(?!.*backup)/i,  // fresh seed without prior backup mention
    /DROP\s+DATABASE/i,
    /rm\s+-rf\s+\/(?!tmp)/i,
    /format\s+[c-z]:/i,
  ];

  const WARN_PATTERNS = [
    { re: /migrate:fresh/, msg: 'migrate:fresh will DROP all tables. Ensure backup was taken.' },
    { re: /truncate/i,     msg: 'TRUNCATE is destructive. Verify correct table.' },
    { re: /artisan\s+down/, msg: 'Putting app in maintenance mode.' },
  ];

  // Check hard blocks
  for (const re of HARD_BLOCK) {
    if (re.test(cmd)) {
      const result = {
        decision: 'deny',
        reason: `[Safety Gate] BLOCKED: "${cmd.slice(0, 80)}" matches a destructive pattern. Take a DB backup first, then retry.`
      };
      process.stdout.write(JSON.stringify(result));
      return;
    }
  }

  // Check warnings — ask user
  for (const { re, msg } of WARN_PATTERNS) {
    if (re.test(cmd)) {
      const result = {
        decision: 'ask',
        reason: `[Safety Gate] WARNING: ${msg}\nCommand: ${cmd.slice(0, 120)}`
      };
      process.stdout.write(JSON.stringify(result));
      return;
    }
  }

  // Allow all others
  process.stdout.write(JSON.stringify({ decision: 'allow' }));
});
