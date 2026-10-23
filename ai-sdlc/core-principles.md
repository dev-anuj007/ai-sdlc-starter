# AI-SDLC Core Principles & Agent Guardrails

> This document defines the foundational engineering standards and agent behavioral guardrails across all AI tools (Cursor, Claude Code, Antigravity, Gemini, Copilot, Windsurf, Roo/Cline).

---

## 1. Prime Directive

Every AI agent operating in this repository must prioritize **software correctness, maintainability, minimal blast radius, and transparency**. AI assistants are collaborative engineering partners, not black-box code dumpers.

---

## 2. Universal Agent Guardrails

1. **Read Before Writing**:
   - Always inspect existing code conventions, folder structures, and active patterns before suggesting or creating new files.
   - Never assume a library or utility is present—check the project configuration and dependencies first.

2. **Minimal Blast Radius & Surgical Edits**:
   - Make the smallest possible diff that completely satisfies the requirement.
   - Do not reformat untouched code, rewrite working functions without cause, or remove comments/documentation.
   - Preserve existing style, indentation, and architectural conventions.

3. **Spec & Task First (No Premature Coding)**:
   - For any non-trivial feature or refactor, outline the technical specification and task plan before generating code.
   - Break complex changes into small, verifiable, atomic milestones.

4. **Verify Every Step**:
   - Never consider a task finished without testing or validating the outcome.
   - Run relevant unit tests, linters, or typecheckers if available.
   - If tests do not exist, write tests or describe exact manual reproduction/verification steps.

5. **No Hallucinated Dependencies**:
   - Do not import external packages without checking whether they are already in the project manifest or requesting permission.
   - Use language standard libraries whenever practical.

6. **Defensive Security & Privacy**:
   - Never hardcode secrets, API keys, tokens, or personal identifiers in code or commits.
   - Always sanitize inputs and use parameterized queries / safe APIs.

---

## 3. Commit & Git Hygiene

- **Atomic Commits**: Each commit represents one logical change.
- **Conventional Commits**: Use conventional commit prefixes:
  - `feat:` New features
  - `fix:` Bug fixes
  - `docs:` Documentation changes
  - `style:` Formatting, missing semicolons, etc. (no code logic change)
  - `refactor:` Code restructuring without feature addition or bug fix
  - `test:` Adding or refactoring tests
  - `chore:` Build process, auxiliary tools, dependency updates
- **Descriptive Messages**: Explain *why* the change was made, not just *what* lines were edited.

---

## 4. Context Preservation & Memory

- When completing major milestones, update the relevant project documentation in `ai-sdlc/memory/` or `docs/`.
- Document key architectural decisions using the ADR format in `ai-sdlc/templates/ADR_TEMPLATE.md`.
