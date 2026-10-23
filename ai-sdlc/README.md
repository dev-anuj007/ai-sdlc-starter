# AI-SDLC Directory Structure

This folder contains the **Single Source of Truth (SSOT)** for the repository's AI Software Development Life Cycle.

```
ai-sdlc/
├── core-principles.md    # Universal coding standards & agent guardrails
├── workflow-phases.md    # The 5-stage lifecycle (PRD -> Arch -> Spec -> Dev -> Audit)
├── personas/             # Specialized role definitions
│   ├── product-manager.md
│   ├── system-architect.md
│   ├── senior-developer.md
│   ├── qa-engineer.md
│   └── security-auditor.md
├── templates/            # Standard templates
│   ├── PRD_TEMPLATE.md
│   ├── ADR_TEMPLATE.md
│   ├── SPEC_TEMPLATE.md
│   └── REVIEW_CHECKLIST.md
└── memory/               # Living project memory & architecture overview
    ├── project-context.md
    └── architecture-summary.md
```

## How Rules Are Kept in Sync
Whenever you update files in `ai-sdlc/`, run the sync script to automatically propagate changes to all AI tool configuration files (`.cursorrules`, `CLAUDE.md`, `AGENTS.md`, `GEMINI.md`, `.windsurfrules`, `.clinerules`, `.roomodes`, etc.):

```bash
# Using Python (zero external dependencies)
python scripts/sync-rules.py

# Or using Node.js (zero external dependencies)
node scripts/sync-rules.js
```
