# AI-SDLC Universal Base Template

> A production-grade, stack-agnostic boilerplate implementing the **AI Software Development Life Cycle (AI-SDLC)** with **Universal Agent Detection** across **Cursor, Claude Code, Antigravity, Gemini, GitHub Copilot, Windsurf, Cline, and Roo Code**.

---

## 🌟 Why AI-SDLC?

Modern software engineering with AI requires structure, discipline, and guardrails. Without a framework, AI assistants often generate brittle code, hallucinate packages, cause regressions, and introduce security vulnerabilities.

The **AI-SDLC** framework divides AI-assisted development into five verifiable phases with specialized personas and clear quality gates:

```
┌─────────────────────┐      ┌─────────────────────┐      ┌─────────────────────┐
│    Phase 1: PRD     │ ───► │    Phase 2: Arch    │ ───► │    Phase 3: Plan    │
│   Product Manager   │      │   System Architect  │      │    Task Checklist   │
│   (@pm / /pm)       │      │ (@architect / /arch)│      │  (Atomic Milestones)│
└─────────────────────┘      └─────────────────────┘      └─────────────────────┘
                                                                     │
                                                                     ▼
┌─────────────────────┐                                   ┌─────────────────────┐
│   Phase 5: Audit    │ ◄──────────────────────────────── │    Phase 4: Build   │
│    QA & Security    │         Verification Loop         │   Senior Developer  │
│  (@qa & @security)  │                                   │   (@dev / /dev)     │
└─────────────────────┘                                   └─────────────────────┘
```

---

## 🚀 Universal AI Agent Detection Matrix

This template guarantees that your AI instructions, personas, and memory are **automatically detected** by all major AI coding tools without configuration friction:

| Tool | Detection File(s) | Features Supported |
| :--- | :--- | :--- |
| **Cursor** | `.cursorrules`, `.cursor/rules/*.mdc` | Full Cursor Rules 2.0 with glob matching and alwaysApply |
| **Claude Code & Desktop** | `CLAUDE.md`, `.claude/settings.json` | Project memory, CLI commands, slash command shortcuts |
| **Antigravity / Gemini** | `AGENTS.md`, `GEMINI.md`, `.agents/rules/` | Antigravity multi-agent orchestration, root directives |
| **GitHub Copilot** | `.github/copilot-instructions.md` | Workspace instructions, PR assistance, chat context |
| **Windsurf** | `.windsurfrules` | Cascade flows, memory references, guardrails |
| **Cline & Roo Code** | `.clinerules`, `.roomodes` | 5 dedicated custom UI modes (PM, Architect, Dev, QA, Sec) |

---

## 🎭 Role-Based Personas

Activate specialized engineering personas on demand by typing the prefix in any chat:

### 1. `@pm` / `/pm` — Product Manager
- **Goal**: Turns ambiguous requests into testable Product Requirements Documents (PRDs).
- **Behavior**: Clarifies edge cases, defines user stories, writes Gherkin acceptance criteria (`Given/When/Then`), and marks explicit non-goals.
- **Reference**: `ai-sdlc/personas/product-manager.md` | Template: `ai-sdlc/templates/PRD_TEMPLATE.md`

### 2. `@architect` / `/architect` — System Architect
- **Goal**: Designs robust architectures, interface contracts, and documents technical trade-offs.
- **Behavior**: Evaluates competing approaches (Option A vs Option B) with pros/cons and creates Architecture Decision Records (ADRs).
- **Reference**: `ai-sdlc/personas/system-architect.md` | Template: `ai-sdlc/templates/ADR_TEMPLATE.md`

### 3. `@dev` / `/dev` — Senior Developer
- **Goal**: Delivers clean, surgical, type-safe implementations.
- **Behavior**: Writes minimal diffs, practices TDD, preserves existing patterns, and uses Conventional Commits (`feat:`, `fix:`).
- **Reference**: `ai-sdlc/personas/senior-developer.md`

### 4. `@qa` / `/qa` — QA & Test Automation Engineer
- **Goal**: Uncovers boundary flaws, null states, and prevents regressions.
- **Behavior**: Validates test matrices, stress cases, and verifies that every PRD acceptance criterion has a passing automated test.
- **Reference**: `ai-sdlc/personas/qa-engineer.md`

### 5. `@security` / `/security` — Application Security Auditor
- **Goal**: Protects against OWASP Top 10 vulnerabilities, secrets leakage, and unauthorized access.
- **Behavior**: Scans for SQL/command injection, hardcoded credentials, and missing sanitization before merge.
- **Reference**: `ai-sdlc/personas/security-auditor.md` | Template: `ai-sdlc/templates/REVIEW_CHECKLIST.md`

---

## 📁 Repository Structure

```
.
├── .agents/                    # Antigravity agent configuration & rules
│   └── rules/
│       └── ai-sdlc.md
├── .claude/                    # Claude Code configuration
│   └── settings.json
├── .cursor/                    # Cursor 2.0 rule definitions
│   └── rules/
│       ├── 000-ai-sdlc-core.mdc
│       ├── 100-persona-pm.mdc
│       ├── 200-persona-architect.mdc
│       ├── 300-persona-developer.mdc
│       ├── 400-persona-qa.mdc
│       └── 500-persona-security.mdc
├── .github/
│   ├── copilot-instructions.md # GitHub Copilot custom instructions
│   └── PULL_REQUEST_TEMPLATE.md# Pull request template with AI-SDLC checklist
├── ai-sdlc/                    # Single Source of Truth (SSOT)
│   ├── core-principles.md      # Foundational engineering rules
│   ├── workflow-phases.md      # The 5-stage lifecycle guide
│   ├── personas/               # Persona instructions
│   │   ├── product-manager.md
│   │   ├── system-architect.md
│   │   ├── senior-developer.md
│   │   ├── qa-engineer.md
│   │   └── security-auditor.md
│   ├── templates/              # PRD, ADR, Spec, and Review templates
│   │   ├── PRD_TEMPLATE.md
│   │   ├── ADR_TEMPLATE.md
│   │   ├── SPEC_TEMPLATE.md
│   │   └── REVIEW_CHECKLIST.md
│   └── memory/                 # Living project memory & architecture map
│       ├── project-context.md
│       └── architecture-summary.md
├── scripts/
│   ├── sync-rules.py           # Zero-dependency Python validation script
│   └── sync-rules.js           # Zero-dependency Node.js validation script
├── .clinerules                 # Cline instructions
├── .cursorrules                # Cursor legacy root rules
├── .roomodes                   # Roo Code custom modes (PM, Arch, Dev, QA, Sec)
├── .windsurfrules              # Windsurf instructions
├── AGENTS.md                   # Universal root agent standard
├── CLAUDE.md                   # Claude Code CLI memory & instructions
├── GEMINI.md                   # Gemini CLI & Google agent directives
└── README.md
```

---

## 🔄 Keeping Rules in Sync (Single Source of Truth)

Whenever you edit files inside `ai-sdlc/`, run the zero-dependency synchronizer to verify that all tool configuration files are aligned:

```bash
# Using Python
python scripts/sync-rules.py

# Or using Node.js
node scripts/sync-rules.js

# Run in CI / verification mode (returns exit code 1 if files are missing)
python scripts/sync-rules.py --check
```

---

## 🛠️ How to Use This Template in Your Project

### Option A: Starting a New Project
1. Copy or clone this boilerplate into your new project directory.
2. Update `ai-sdlc/memory/project-context.md` with your project's name, tech stack, and goals.
3. Update `CLAUDE.md` common commands with your package manager or test commands (e.g. `npm test`, `pytest`, `cargo test`).
4. Initialize git and start building!

### Option B: Adding to an Existing Project
1. Copy the `ai-sdlc/`, `.cursor/`, `.agents/`, `.claude/`, `.github/`, and root dotfiles into your existing repository.
2. Run `python scripts/sync-rules.py` to confirm everything is linked.
3. Commit the configuration:
   ```bash
   git add .
   git commit -m "chore: adopt AI-SDLC universal agent framework"
   ```

---

## 📜 License
MIT License. Free to use and adapt in open source and proprietary projects.
