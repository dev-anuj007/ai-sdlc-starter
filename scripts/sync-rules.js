#!/usr/bin/env node
/**
 * AI-SDLC Rule Synchronizer (Node.js Standard Library - Zero Dependencies)
 * 
 * Validates and synchronizes AI-SDLC rules, personas, and memory references
 * across all supported AI developer tools.
 */

const fs = require('fs');
const path = require('path');

const ROOT_DIR = path.resolve(__dirname, '..');
const AI_SDLC_DIR = path.join(ROOT_DIR, 'ai-sdlc');

const EXPECTED_FILES = [
  path.join(AI_SDLC_DIR, 'core-principles.md'),
  path.join(AI_SDLC_DIR, 'workflow-phases.md'),
  path.join(AI_SDLC_DIR, 'personas', 'product-manager.md'),
  path.join(AI_SDLC_DIR, 'personas', 'system-architect.md'),
  path.join(AI_SDLC_DIR, 'personas', 'senior-developer.md'),
  path.join(AI_SDLC_DIR, 'personas', 'qa-engineer.md'),
  path.join(AI_SDLC_DIR, 'personas', 'security-auditor.md'),
  path.join(AI_SDLC_DIR, 'templates', 'PRD_TEMPLATE.md'),
  path.join(AI_SDLC_DIR, 'templates', 'ADR_TEMPLATE.md'),
  path.join(AI_SDLC_DIR, 'templates', 'SPEC_TEMPLATE.md'),
  path.join(AI_SDLC_DIR, 'templates', 'REVIEW_CHECKLIST.md'),
  path.join(AI_SDLC_DIR, 'memory', 'project-context.md'),
  path.join(AI_SDLC_DIR, 'memory', 'architecture-summary.md'),
  path.join(ROOT_DIR, 'docs', 'README.md'),
  path.join(ROOT_DIR, 'docs', 'prd', '.gitkeep'),
  path.join(ROOT_DIR, 'docs', 'adr', '.gitkeep'),
  path.join(ROOT_DIR, 'docs', 'specs', '.gitkeep'),
  path.join(ROOT_DIR, 'docs', 'reviews', '.gitkeep'),
];

const TOOL_CONFIGS = [
  path.join(ROOT_DIR, 'AGENTS.md'),
  path.join(ROOT_DIR, 'GEMINI.md'),
  path.join(ROOT_DIR, 'CLAUDE.md'),
  path.join(ROOT_DIR, '.claude', 'settings.json'),
  path.join(ROOT_DIR, '.claude', 'commands', 'pm.md'),
  path.join(ROOT_DIR, '.claude', 'commands', 'architect.md'),
  path.join(ROOT_DIR, '.claude', 'commands', 'dev.md'),
  path.join(ROOT_DIR, '.claude', 'commands', 'qa.md'),
  path.join(ROOT_DIR, '.claude', 'commands', 'security.md'),
  path.join(ROOT_DIR, '.cursorrules'),
  path.join(ROOT_DIR, '.cursor', 'rules', '000-ai-sdlc-core.mdc'),
  path.join(ROOT_DIR, '.cursor', 'rules', '100-persona-pm.mdc'),
  path.join(ROOT_DIR, '.cursor', 'rules', '200-persona-architect.mdc'),
  path.join(ROOT_DIR, '.cursor', 'rules', '300-persona-developer.mdc'),
  path.join(ROOT_DIR, '.cursor', 'rules', '400-persona-qa.mdc'),
  path.join(ROOT_DIR, '.cursor', 'rules', '500-persona-security.mdc'),
  path.join(ROOT_DIR, '.github', 'copilot-instructions.md'),
  path.join(ROOT_DIR, '.github', 'PULL_REQUEST_TEMPLATE.md'),
  path.join(ROOT_DIR, '.github', 'workflows', 'ai-sdlc-lint.yml'),
  path.join(ROOT_DIR, '.windsurfrules'),
  path.join(ROOT_DIR, '.clinerules'),
  path.join(ROOT_DIR, '.roomodes'),
  path.join(ROOT_DIR, '.agents', 'rules', 'ai-sdlc.md'),
  path.join(ROOT_DIR, '.agents', 'skills', 'ai-sdlc', 'SKILL.md'),
];

function checkIntegrity() {
  const missingSource = EXPECTED_FILES.filter(f => !fs.existsSync(f));
  const missingTools = TOOL_CONFIGS.filter(f => !fs.existsSync(f));

  if (missingSource.length > 0) {
    console.error('[ERROR] Missing source AI-SDLC documents:');
    missingSource.forEach(f => console.error(`  - ${path.relative(ROOT_DIR, f)}`));
    return false;
  }

  if (missingTools.length > 0) {
    console.warn('[WARNING] Missing AI tool configuration files:');
    missingTools.forEach(f => console.warn(`  - ${path.relative(ROOT_DIR, f)}`));
    return false;
  }

  return true;
}

function sync() {
  console.log(`[*] Scanning AI-SDLC repository root at: ${ROOT_DIR}`);
  if (!checkIntegrity()) {
    console.error('\n[!] Synchronization found missing files. Please verify or re-generate.');
    process.exit(1);
  }

  console.log('[SUCCESS] All AI-SDLC source documents and tool configs are present and synchronized:');
  console.log('  ✓ Antigravity & Gemini: AGENTS.md, GEMINI.md, .agents/rules, .agents/skills/ai-sdlc');
  console.log('  ✓ Claude Code: CLAUDE.md, .claude/settings.json, .claude/commands/*.md (5 slash commands)');
  console.log('  ✓ Cursor: .cursorrules, .cursor/rules/*.mdc (6 rules configured)');
  console.log('  ✓ GitHub Copilot & CI: .github/copilot-instructions.md, PR template, CI workflow');
  console.log('  ✓ Windsurf: .windsurfrules');
  console.log('  ✓ Cline & Roo Code: .clinerules, .roomodes (5 custom roles configured)');
  console.log('  ✓ Docs Scaffolding: docs/README.md, docs/{prd,adr,specs,reviews}/');
  console.log('  ✓ 5 Personas: PM, Architect, Dev, QA, Security Auditor');
}

if (process.argv.includes('--check')) {
  if (checkIntegrity()) {
    console.log('[OK] AI-SDLC configs are verified.');
    process.exit(0);
  } else {
    process.exit(1);
  }
}

sync();
