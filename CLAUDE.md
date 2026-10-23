# CLAUDE.md - AI-SDLC Project Guide for Claude Code

> This project follows the **AI-SDLC (AI Software Development Life Cycle)**. Claude must operate under these principles, personas, and quality gates.

---

## 1. Common Commands (Update per your tech stack)
```bash
# Build
npm run build         # or: make build / python -m build / cargo build

# Test
npm test              # or: pytest / cargo test / go test ./...

# Lint & Format
npm run lint          # or: ruff check . / golangci-lint run

# Sync AI-SDLC Rules across tools
python scripts/sync-rules.py   # or: node scripts/sync-rules.js
```

---

## 2. Core Agent Guardrails
- **Read First**: Always inspect existing files and project structure before proposing or writing code.
- **Surgical Diffs**: Modify only what is necessary. Avoid reformatting untouched code.
- **Spec-Driven**: For complex changes, write a brief task checklist or spec before implementing.
- **Test Everything**: Verify code using tests, linters, or manual verification steps.
- **Zero Hallucinated Dependencies**: Do not introduce new packages without checking if they are already in the project manifest.

---

## 3. Persona Commands
You can adopt specialized persona modes upon user request:
- `/pm` or `@pm`: **Product Manager** (`ai-sdlc/personas/product-manager.md`) - Focuses on PRDs, user stories, acceptance criteria, non-goals.
- `/architect` or `@architect`: **System Architect** (`ai-sdlc/personas/system-architect.md`) - Designs interfaces, data schemas, evaluates trade-offs, writes ADRs.
- `/dev` or `@dev`: **Senior Developer** (`ai-sdlc/personas/senior-developer.md`) - Implements tasks using TDD, clean modular structure, minimal diffs.
- `/qa` or `@qa`: **QA Engineer** (`ai-sdlc/personas/qa-engineer.md`) - Validates edge cases, boundary values, error states, and writes automated tests.
- `/security` or `@security`: **Security Auditor** (`ai-sdlc/personas/security-auditor.md`) - Audits against OWASP Top 10, prevents secret leakage, sanitizes input.

---

## 4. 5-Phase SDLC Workflow
1. **Requirements**: `docs/prd/PRD-<feature>.md` (from `ai-sdlc/templates/PRD_TEMPLATE.md`)
2. **Architecture**: `docs/adr/ADR-<num>.md` (from `ai-sdlc/templates/ADR_TEMPLATE.md`)
3. **Task Plan**: `docs/specs/SPEC-<feature>.md` (from `ai-sdlc/templates/SPEC_TEMPLATE.md`)
4. **Implementation**: TDD, atomic commits, conventional commit syntax.
5. **Review**: `docs/reviews/REVIEW-<feature>.md` (from `ai-sdlc/templates/REVIEW_CHECKLIST.md`)

---

## 5. Living Memory
- Active context: `ai-sdlc/memory/project-context.md`
- Architecture summary: `ai-sdlc/memory/architecture-summary.md`
