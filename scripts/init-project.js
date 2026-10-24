#!/usr/bin/env node
/**
 * AI-SDLC Project Initializer (Node.js Standard Library - Zero Dependencies)
 * 
 * Quickly customizes the AI-SDLC boilerplate for a new project.
 * Supports both CLI argument flags and interactive prompts.
 * Idempotent: safe to run multiple times to update settings.
 * 
 * Usage:
 *   node scripts/init-project.js --name "My App" --stack "TypeScript" --test "npm test" --lint "npm run lint"
 *   node scripts/init-project.js (interactive prompt)
 */

const fs = require('fs');
const path = require('path');
const readline = require('readline');

const ROOT_DIR = path.resolve(__dirname, '..');
const CONTEXT_FILE = path.join(ROOT_DIR, 'ai-sdlc', 'memory', 'project-context.md');
const CLAUDE_FILE = path.join(ROOT_DIR, 'CLAUDE.md');

function parseArgs(argv) {
  const args = {};
  for (let i = 2; i < argv.length; i++) {
    const arg = argv[i];
    if (arg === '--help' || arg === '-h') {
      args.help = true;
    } else if (arg.startsWith('--')) {
      const key = arg.slice(2);
      if (i + 1 < argv.length && !argv[i + 1].startsWith('--')) {
        args[key] = argv[++i];
      } else {
        args[key] = true;
      }
    }
  }
  return args;
}

function initProject(name, description, stack, testCmd, lintCmd, buildCmd) {
  buildCmd = buildCmd || 'npm run build';
  console.log(`[*] Initializing AI-SDLC template for project: ${name}`);

  // 1. Update project-context.md (Idempotent regex matching)
  if (fs.existsSync(CONTEXT_FILE)) {
    let content = fs.readFileSync(CONTEXT_FILE, 'utf-8');
    content = content.replace(/^- \*\*Project Name\*\*:.*$/m, `- **Project Name**: ${name}`);
    content = content.replace(/^- \*\*Purpose\*\*:.*$/m, `- **Purpose**: ${description}`);
    content = content.replace(/^- \*\*Primary Tech Stack\*\*:.*$/m, `- **Primary Tech Stack**: ${stack}`);
    content = content.replace(/^- \*\*Testing Command\*\*:.*$/m, `- **Testing Command**: \`${testCmd}\``);
    content = content.replace(/^- \*\*Linting & Formatting\*\*:.*$/m, `- **Linting & Formatting**: \`${lintCmd}\``);
    fs.writeFileSync(CONTEXT_FILE, content, 'utf-8');
    console.log(`  ✓ Updated ${path.relative(ROOT_DIR, CONTEXT_FILE)}`);
  }

  // 2. Update CLAUDE.md (Idempotent regex matching)
  if (fs.existsSync(CLAUDE_FILE)) {
    let content = fs.readFileSync(CLAUDE_FILE, 'utf-8');
    content = content.replace(/(# Build\r?\n)[^\r\n]+/m, `$1${buildCmd}`);
    content = content.replace(/(# Test\r?\n)[^\r\n]+/m, `$1${testCmd}`);
    content = content.replace(/(# Lint & Format\r?\n)[^\r\n]+/m, `$1${lintCmd}`);
    fs.writeFileSync(CLAUDE_FILE, content, 'utf-8');
    console.log(`  ✓ Updated ${path.relative(ROOT_DIR, CLAUDE_FILE)}`);
  }

  console.log(`\n[SUCCESS] AI-SDLC configuration initialized for '${name}'!`);
  console.log('Run rule verification at any time: node scripts/sync-rules.js --check');
}

function printHelp() {
  console.log(`
AI-SDLC Project Initializer
Usage:
  node scripts/init-project.js [options]

Options:
  --name   <string>  Project name (default: My Project)
  --desc   <string>  Project description
  --stack  <string>  Primary tech stack (default: TypeScript)
  --test   <string>  Test command (default: npm test)
  --lint   <string>  Lint command (default: npm run lint)
  --build  <string>  Build command (default: npm run build)
  --help, -h         Show this help message
`);
}

function promptInteractive() {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  console.log('=== AI-SDLC Project Quickstart ===');
  rl.question('Project Name (default: My Project): ', (name) => {
    rl.question('Project Description: ', (desc) => {
      rl.question('Primary Tech Stack (e.g. TypeScript, Python, Rust): ', (stack) => {
        rl.question('Test Command (default: npm test): ', (testCmd) => {
          rl.question('Lint Command (default: npm run lint): ', (lintCmd) => {
            rl.question('Build Command (default: npm run build): ', (buildCmd) => {
              rl.close();
              initProject(
                name.trim() || 'My Project',
                desc.trim() || 'A modern application governed by AI-SDLC',
                stack.trim() || 'TypeScript',
                testCmd.trim() || 'npm test',
                lintCmd.trim() || 'npm run lint',
                buildCmd.trim() || 'npm run build'
              );
            });
          });
        });
      });
    });
  });
}

const args = parseArgs(process.argv);

if (args.help) {
  printHelp();
  process.exit(0);
}

if (args.name || args.desc || args.stack || args.test || args.lint || args.build) {
  initProject(
    args.name || 'My Project',
    args.desc || 'A modern application governed by AI-SDLC',
    args.stack || 'TypeScript',
    args.test || 'npm test',
    args.lint || 'npm run lint',
    args.build || 'npm run build'
  );
} else if (!process.stdin.isTTY) {
  // Headless / non-interactive environment fallback
  initProject(
    'My Project',
    'A modern application governed by AI-SDLC',
    'Polyglot',
    'npm test',
    'npm run lint',
    'npm run build'
  );
} else {
  promptInteractive();
}
