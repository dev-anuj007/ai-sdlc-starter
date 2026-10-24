---
name: ai-sdlc
description: Guides and enforces the 5-phase AI Software Development Life Cycle (PRD -> Architecture/ADR -> Task Plan -> Build/TDD -> QA & Security Review). Use whenever planning, implementing, reviewing, or verifying software features under the AI-SDLC framework.
---

# AI-SDLC (AI Software Development Life Cycle) Skill

This skill enforces disciplined, verifiable software engineering workflows using the AI-SDLC framework.

## 5-Phase Workflow

```
Phase 1: PRD (@pm) ──► Phase 2: Arch (@architect) ──► Phase 3: Plan (@dev)
                                                               │
Phase 5: Audit (@qa & @security) ◄──── Phase 4: Build (@dev) ◄─┘
```

### Phase 1: Requirements & PRD
- **Persona**: `@pm` / `/pm` (Product Manager)
- **Document**: `docs/prd/PRD-<feature>.md` (Template: `ai-sdlc/templates/PRD_TEMPLATE.md`)
- **Key Actions**: Define problem statement, user personas, testable acceptance criteria (Given/When/Then), and explicit non-goals. Do not write implementation code.

### Phase 2: Architecture & ADR
- **Persona**: `@architect` / `/architect` (System Architect)
- **Document**: `docs/adr/ADR-<num>-<title>.md` (Template: `ai-sdlc/templates/ADR_TEMPLATE.md`)
- **Key Actions**: Evaluate at least 2 alternate approaches, document technical trade-offs, define data schemas and API boundaries.

### Phase 3: Technical Spec & Task Plan
- **Persona**: System Architect / Senior Developer
- **Document**: `docs/specs/SPEC-<feature>.md` (Template: `ai-sdlc/templates/SPEC_TEMPLATE.md`)
- **Key Actions**: Break the design into atomic, checkable milestone tasks (`[ ]`). Order dependencies sequentially.

### Phase 4: Implementation & TDD
- **Persona**: `@dev` / `/dev` (Senior Developer)
- **Key Actions**:
  - Implement surgically with minimal diff blast radius.
  - Write automated tests alongside business logic.
  - Follow existing codebase patterns and type definitions.
  - Adhere to Conventional Commits format (`feat:`, `fix:`, `refactor:`, `test:`).

### Phase 5: Verification & Review
- **Personas**: `@qa` / `/qa` (QA Engineer) & `@security` / `/security` (Security Auditor)
- **Document**: `docs/reviews/REVIEW-<feature>.md` (Template: `ai-sdlc/templates/REVIEW_CHECKLIST.md`)
- **Key Actions**:
  - **QA**: Test boundary extremes (0, null, empty), error recovery, and verify all PRD criteria pass.
  - **Security**: Audit for OWASP Top 10 vulnerabilities, verify no hardcoded secrets or API tokens exist, check perimeter authorization.

## Universal Agent Directives
1. **Read First**: Always inspect existing code conventions and dependencies before creating files.
2. **Zero Hallucinated Dependencies**: Verify that libraries exist in package manifests before importing.
3. **Living Memory**: Check `ai-sdlc/memory/project-context.md` for project status and update upon milestone completion.
