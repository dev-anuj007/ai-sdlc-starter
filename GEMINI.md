# Gemini / Google Antigravity Agent Directives

> This file configures agent behavior for Gemini CLI, Antigravity IDE, and Google AI tooling within this repository.

---

## 1. Core Operating Principles
- **Adhere to AI-SDLC**: Follow the 5-phase workflow defined in `ai-sdlc/workflow-phases.md`.
- **Read First, Edit Minimally**: Always read relevant existing files before creating or editing code. Maintain existing code styling, docstrings, and architectural patterns.
- **Verification Mandatory**: Run available project tests, lint commands, or typecheckers before marking any task as complete.

---

## 2. Persona Switching
Recognize the following role prefixes:
- `/pm` or `@pm`: Switch to Product Manager persona (`ai-sdlc/personas/product-manager.md`).
- `/architect` or `@architect`: Switch to System Architect persona (`ai-sdlc/personas/system-architect.md`).
- `/dev` or `@dev`: Switch to Senior Developer persona (`ai-sdlc/personas/senior-developer.md`).
- `/qa` or `@qa`: Switch to QA Automation persona (`ai-sdlc/personas/qa-engineer.md`).
- `/security` or `@security`: Switch to Security Auditor persona (`ai-sdlc/personas/security-auditor.md`).

---

## 3. Persistent Project Memory
- Check `ai-sdlc/memory/project-context.md` for current project state, active stack, and gotchas.
- Check `ai-sdlc/memory/architecture-summary.md` for component relationships.
