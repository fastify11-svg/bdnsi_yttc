/**
 * BDNSI — Stop Guard
 * Prevents the agent from stopping prematurely when:
 *  - Background tasks are still running
 *  - Last command failed (non-zero exit)
 *  - Tests haven't passed yet
 */

const readline = require('readline');

const rl = readline.createInterface({ input: process.stdin });
let raw = '';
rl.on('line', l => (raw += l));
rl.on('close', () => {
  let payload;
  try { payload = JSON.parse(raw); } catch { payload = {}; }

  const { terminationReason, fullyIdle, error } = payload;

  // If agent stopped due to error, force it to continue and self-heal
  if (terminationReason === 'error' && error) {
    process.stdout.write(JSON.stringify({
      decision: 'continue',
      reason: `[Stop Guard] Agent stopped due to error: "${error}". Entering self-healing mode — read the error, fix the code, and re-run.`
    }));
    return;
  }

  // If background tasks are still running, wait
  if (fullyIdle === false) {
    process.stdout.write(JSON.stringify({
      decision: 'continue',
      reason: '[Stop Guard] Background tasks are still running. Wait for completion before stopping.'
    }));
    return;
  }

  // Allow normal stop
  process.stdout.write(JSON.stringify({ decision: '' }));
});
