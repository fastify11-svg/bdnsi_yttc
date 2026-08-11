import fs from 'fs';
import { execSync } from 'child_process';
import { GoogleGenerativeAI } from '@google/generative-ai';

async function run() {
    console.log("🤖 Initiating Autonomous Self-Healing Protocol...");
    
    const apiKey = process.env.GEMINI_API_KEY;
    if (!apiKey) {
        console.error("❌ GEMINI_API_KEY is missing. Cannot self-heal.");
        process.exit(1);
    }

    const genAI = new GoogleGenerativeAI(apiKey);
    const model = genAI.getGenerativeModel({ model: "gemini-1.5-pro-latest" });

    // Gather error context from local log files if they exist
    let errorContext = "GitHub Action Pipeline Failed.\n\n";
    
    if (fs.existsSync('setup.log')) {
        errorContext += "=== setup.log ===\n" + fs.readFileSync('setup.log', 'utf8').slice(-2000) + "\n\n";
    }
    if (fs.existsSync('playwright-output.log')) {
        errorContext += "=== playwright-output.log ===\n" + fs.readFileSync('playwright-output.log', 'utf8').slice(-2000) + "\n\n";
    }

    if (errorContext.length < 100) {
        console.log("No explicit log files found. The error might be a syntax error or a build issue not piped to logs.");
        errorContext += "Please analyze the standard Laravel project and common E2E issues.";
    }

    console.log("🔍 Analyzing error with Gemini AI...");
    
    const prompt = `
    You are an autonomous AI self-healing agent. A CI/CD pipeline for a Laravel + Playwright project just failed.
    Here are the last logs from the failure:
    
    ${errorContext}
    
    Your task is to provide a single bash script that will fix this error in the codebase.
    The script will be executed directly in the root of the project (Ubuntu Linux).
    You can use commands like 'sed', 'echo', 'rm', etc., to modify files.
    
    IMPORTANT: Provide ONLY the bash script inside a markdown bash block (\`\`\`bash ... \`\`\`). Do not explain anything.
    Make sure the script is safe and actually fixes the likely root cause.
    `;

    try {
        const result = await model.generateContent(prompt);
        const responseText = result.response.text();
        
        // Extract bash script
        const match = responseText.match(/```bash\n([\s\S]*?)```/);
        if (match && match[1]) {
            const fixScript = match[1];
            console.log("🛠️ AI generated fix script. Executing...");
            console.log(fixScript);
            
            fs.writeFileSync('auto_fix.sh', fixScript);
            execSync('bash auto_fix.sh', { stdio: 'inherit' });
            
            console.log("✅ Fix applied. Committing to repository...");
            
            execSync('git config --global user.name "Autonomous AI Bot"');
            execSync('git config --global user.email "ai-bot@fastify11.local"');
            execSync('git add .');
            execSync('git commit -m "fix: AI Autonomous Self-Healing Patch"');
            
            // Push using the GITHUB_TOKEN already configured by actions/checkout
            execSync('git push', { stdio: 'inherit' });
            console.log("🚀 Fix pushed successfully! The pipeline will restart.");
        } else {
            console.error("❌ AI did not return a valid bash script block.");
        }
    } catch (error) {
        console.error("❌ AI Analysis failed:", error);
    }
}

run();
