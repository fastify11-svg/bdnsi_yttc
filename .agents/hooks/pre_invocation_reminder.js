/**
 * BDNSI — Pre-Invocation Context Injector
 * Runs BEFORE the model is called each turn.
 * Injects a brief reminder of the active workflow rules
 * so the agent stays on-track across long conversations.
 */

const readline = require('readline');

const rl = readline.createInterface({ input: process.stdin });
let raw = '';
rl.on('line', l => (raw += l));
rl.on('close', () => {
  let payload;
  try { payload = JSON.parse(raw); } catch { payload = {}; }

  const invNum = payload?.invocationNum || 0;

  // Only inject reminder every 5 invocations to avoid noise
  if (invNum % 5 !== 0) {
    process.stdout.write(JSON.stringify({ injectSteps: [] }));
    return;
  }

  const reminder = [
    '🔴 ACTIVE RULES REMINDER (BDNSI Autonomous Workflow v4.0):',
    '  • Always use C:\\xampp\\php\\php.exe (never bare php)',
    '  • Always use C:\\xampp\\php\\composer.bat (never bare composer)',
    '  • After EVERY code change: run tests → fix bugs → push to GitHub',
    '  • Never ask user to run commands manually — do it yourself',
    '  • For destructive DB ops: backup first (mysqldump), then proceed',
    '  • Planning mode: for major features, create implementation_plan.md first',
  ].join('\n');

  process.stdout.write(JSON.stringify({
    injectSteps: [
      { ephemeralMessage: reminder }
    ]
  }));
});
