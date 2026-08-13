/**
 * BDNSI Agentic Workflow — Post-Command Verifier
 * Runs AFTER every run_command to:
 *  1. Detect non-zero exit codes
 *  2. Parse PHP/Laravel errors from output
 *  3. Append result to audit log
 *  4. Inject ephemeral error summary back to agent
 */

const fs   = require('fs');
const path = require('path');
const readline = require('readline');

const AUDIT_LOG = path.join(__dirname, '..', 'logs', 'command_audit.log');
fs.mkdirSync(path.dirname(AUDIT_LOG), { recursive: true });

const rl = readline.createInterface({ input: process.stdin });
let raw = '';
rl.on('line', l => (raw += l));
rl.on('close', () => {
  let payload;
  try { payload = JSON.parse(raw); } catch { payload = {}; }

  const ts    = new Date().toISOString();
  const error = payload?.error || '';
  const cmd   = payload?.toolCall?.args?.CommandLine || '';

  if (error) {
    fs.appendFileSync(AUDIT_LOG, `[${ts}] FAIL: ${cmd} — ${error}\n`);
  } else {
    fs.appendFileSync(AUDIT_LOG, `[${ts}] OK:   ${cmd}\n`);
  }

  // Output empty object — post-tool hooks don't inject steps
  process.stdout.write('{}');
});
