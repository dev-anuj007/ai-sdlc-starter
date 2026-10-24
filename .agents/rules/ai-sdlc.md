# AI-SDLC Antigravity Workspace Rule

## Directives
- **AI-SDLC Workflow**: Before implementing any non-trivial feature or refactor, confirm if an architectural specification or task breakdown exists. If not, suggest running Phase 1 (PRD) or Phase 2 (Arch).
- **Persona Invocation**: Support `@pm`, `@architect`, `@dev`, `@qa`, and `@security` roles. Refer to definitions in `ai-sdlc/personas/`.
- **Quality Gates**:
  - Always write or update tests alongside feature changes.
  - Maintain Conventional Commits format for commit messages.
  - No untested assumptions. Run test commands if available.
- **Skill Reference**: The `.agents/skills/ai-sdlc/SKILL.md` skill provides end-to-end guidance for the 5-phase lifecycle and quality gates.
- **Living Memory**: Check `ai-sdlc/memory/project-context.md` for current project state and `ai-sdlc/memory/architecture-summary.md` for architecture details.
