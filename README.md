# AI-SDLC Universal Base Template

> A production-grade, stack-agnostic boilerplate implementing the **AI Software Development Life Cycle (AI-SDLC)** with **Universal Agent Detection** across **Cursor, Claude Code, Antigravity, Gemini, GitHub Copilot, Windsurf, Cline, and Roo Code**.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![AI-SDLC Quality Gate](https://img.shields.io/badge/AI--SDLC%20Quality%20Gate-Passing-brightgreen.svg)](.github/workflows/ai-sdlc-lint.yml)
[![Supported Tools](https://img.shields.io/badge/Tools-Cursor%20%7C%20Claude%20%7C%20Antigravity%20%7C%20Copilot%20%7C%20Roo-orange)](#-universal-ai-agent-detection-matrix)
[![Framework](https://img.shields.io/badge/Framework-5--Phase%20AI--SDLC-purple.svg)](ai-sdlc/workflow-phases.md)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](#-how-to-use-this-template-in-your-project)

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
├── .agents/                    # Antigravity agent configuration, rules & skills
│   ├── rules/
│   │   └── ai-sdlc.md
│   └── skills/
│       └── ai-sdlc/
│           └── SKILL.md        # Native Antigravity SDLC workflow skill
├── .claude/                    # Claude Code configuration & custom slash commands
│   ├── commands/               # Native Claude Code slash commands
│   │   ├── pm.md               # /pm command
│   │   ├── architect.md        # /architect command
│   │   ├── dev.md              # /dev command
│   │   ├── qa.md               # /qa command
│   │   └── security.md         # /security command
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
│   ├── PULL_REQUEST_TEMPLATE.md# Pull request template with AI-SDLC checklist
│   └── workflows/
│       └── ai-sdlc-lint.yml    # GitHub Actions automated AI-SDLC quality gate
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
├── docs/                       # Project artifacts generated by AI-SDLC personas
│   ├── prd/                    # PRDs generated by @pm
│   ├── adr/                    # Architecture Decision Records by @architect
│   ├── specs/                  # Task breakdown specs by @architect / @dev
│   └── reviews/                # QA & Security audit reports
├── scripts/
│   ├── init-project.py         # Interactive project setup (Python)
│   ├── init-project.js         # Interactive project setup (Node.js)
│   ├── init-project.ps1        # Interactive project setup (PowerShell)
│   ├── sync-rules.py           # Zero-dependency Python validation script
│   ├── sync-rules.js           # Zero-dependency Node.js validation script
│   └── sync-rules.ps1          # Zero-dependency PowerShell validation script
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

## 🔄 Validating Rule Integrity

Whenever you add or update files inside `ai-sdlc/`, run the zero-dependency validator across any supported environment to verify that all tool configurations are present and aligned:

```bash
# Using Python
python scripts/sync-rules.py

# Or using Node.js
node scripts/sync-rules.js

# Or using PowerShell
powershell -ExecutionPolicy Bypass -File scripts/sync-rules.ps1

# Run in CI / verification mode (returns exit code 1 if files are missing)
python scripts/sync-rules.py --check
```

---

## 🛠️ How to Use This Template in Your Project

### Option A: Starting a New Project
1. Copy or clone this boilerplate into your new project directory.
2. Run the project initializer to configure living memory and tool commands in seconds (supports both interactive prompts and non-interactive CLI flags):
   ```bash
   # Interactive prompt:
   python scripts/init-project.py
   # Or: node scripts/init-project.js
   # Or: powershell -ExecutionPolicy Bypass -File scripts/init-project.ps1

   # Or non-interactive CLI flags (great for automation):
   python scripts/init-project.py --name "My App" --stack "TypeScript" --test "npm test" --lint "npm run lint"
   # Or: node scripts/init-project.js --name "My App" --stack "TypeScript" --test "npm test"
   # Or: powershell -ExecutionPolicy Bypass -File scripts/init-project.ps1 -Name "My App" -Stack "TypeScript"
   ```
3. Initialize git and start building!

### Option B: Adding to an Existing Project
1. Copy `ai-sdlc/`, `docs/`, `.cursor/`, `.agents/`, `.claude/`, `.github/`, `scripts/`, and the root dotfiles into your existing repository.
2. Run rule verification to confirm all configurations are present:
   ```bash
   python scripts/sync-rules.py --check
   # Or: node scripts/sync-rules.js --check
   # Or: powershell -ExecutionPolicy Bypass -File scripts/sync-rules.ps1 -Check
   ```
3. Commit the configuration:
   ```bash
   git add .
   git commit -m "chore: adopt AI-SDLC universal agent framework"
   ```

---

## 📖 End-to-End Execution Guide: From Idea to Production

Follow this standard 5-step lifecycle whenever implementing any non-trivial feature, refactor, or architectural change:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            AI-SDLC LIFECYCLE                                │
├──────────────┬───────────────────────────────┬──────────────────────────────┤
│ Phase        │ Lead Persona & Slash Command  │ Output Artifact Location     │
├──────────────┼───────────────────────────────┼──────────────────────────────┤
│ 1. PRD       │ @pm / /pm (Product Manager)   │ docs/prd/PRD-<feature>.md    │
│ 2. Arch      │ @architect / /architect       │ docs/adr/ADR-<num>-<slug>.md │
│ 3. Plan      │ @architect or @dev            │ docs/specs/SPEC-<feature>.md │
│ 4. Build     │ @dev / /dev (Senior Developer)│ src/ and tests/ (TDD Diffs)  │
│ 5. Audit     │ @qa / /qa & @security         │ docs/reviews/REVIEW-<slug>.md│
└──────────────┴───────────────────────────────┴──────────────────────────────┘
```

### Step 1: Requirements & Problem Formulation (PRD)
- **Persona**: `@pm` (chat) or `/pm` (Claude Code) or switch to **Product Manager** mode in Roo Code.
- **Goal**: Transform ambiguous user ideas into a structured, testable Product Requirements Document without premature implementation code.
- **Example Prompt**:
  > `@pm I want to build a user authentication service supporting email/password and OAuth login with GitHub. Please draft the PRD.`
- **Agent Workflow**:
  1. Inspects [`ai-sdlc/templates/PRD_TEMPLATE.md`](ai-sdlc/templates/PRD_TEMPLATE.md).
  2. Asks high-leverage clarifying questions on edge cases (e.g., password reset flow, rate limiting, session expiry).
  3. Produces a structured PRD saved to `docs/prd/PRD-user-auth.md` containing:
     - User personas and problem statement
     - Given / When / Then acceptance criteria
     - Explicit non-goals (e.g., SAML SSO deferred to v2)
- **User Action**: Review the acceptance criteria and approve the PRD.

---

### Step 2: Architecture & Decision Records (ADR)
- **Persona**: `@architect` (chat) or `/architect` (Claude Code) or **System Architect** mode in Roo Code.
- **Goal**: Evaluate technical approaches, select data structures, and establish clear boundary contracts.
- **Example Prompt**:
  > `@architect Review docs/prd/PRD-user-auth.md. Evaluate Option A (stateless JWTs) vs Option B (Redis-backed session tokens). Recommend the best architecture and document it in an ADR.`
- **Agent Workflow**:
  1. Evaluates competing architectural designs against decision drivers (latency, invalidation, complexity).
  2. Creates `docs/adr/ADR-0001-auth-strategy.md` using [`ai-sdlc/templates/ADR_TEMPLATE.md`](ai-sdlc/templates/ADR_TEMPLATE.md).
  3. Documents interface contracts, data models, error codes, and sequence diagrams.
- **User Action**: Sign off on the architectural trade-offs.

---

### Step 3: Technical Spec & Task Plan
- **Persona**: `@architect` or `@dev`
- **Goal**: Decompose the architecture into bite-sized, sequentially executable tasks.
- **Example Prompt**:
  > `@architect Break down docs/prd/PRD-user-auth.md and docs/adr/ADR-0001-auth-strategy.md into an atomic, checkable task checklist in docs/specs/SPEC-user-auth.md.`
- **Agent Workflow**:
  1. Uses [`ai-sdlc/templates/SPEC_TEMPLATE.md`](ai-sdlc/templates/SPEC_TEMPLATE.md).
  2. Breaks the feature into independent, ordered tasks with explicit verification steps:
     ```markdown
     - [ ] Task 1.1: Define User and Session models in src/types/auth.ts
     - [ ] Task 2.1: Implement password hashing service with unit tests
     - [ ] Task 3.1: Implement POST /auth/register endpoint with input validation
     ```
- **User Action**: Confirm the milestone ordering and dependency flow.

---

### Step 4: Implementation & Test-Driven Development (TDD)
- **Persona**: `@dev` (chat) or `/dev` (Claude Code) or **Senior Developer** mode in Roo Code.
- **Goal**: Deliver surgical, type-safe code accompanied by automated tests with minimal diff blast radius.
- **Example Prompt**:
  > `@dev Implement Task 1.1 and Task 2.1 from docs/specs/SPEC-user-auth.md using TDD. Write unit tests first, implement the logic, and verify.`
- **Agent Workflow**:
  1. Writes unit/integration tests before or alongside business logic.
  2. Makes targeted code edits adhering to existing patterns and strict typing.
  3. Verifies that tests pass by running your project's test command (e.g. `npm test` or `pytest`).
  4. Checks off completed items in `docs/specs/SPEC-user-auth.md`.
  5. Formats commits following Conventional Commits (`feat: add argon2id password hashing service`).

---

### Step 5: Verification, QA & Security Audit
- **Persona**: `@qa` and `@security` (chat) or `/qa`, `/security` (Claude Code).
- **Goal**: Uncover boundary edge cases, test regression risks, and verify zero OWASP vulnerabilities.
- **Example Prompts**:
  > `@qa Review the diff and test edge cases: null passwords, malformed emails, token replay, and network timeouts.`
  > `@security Audit the new auth endpoints against OWASP Top 10 and verify no sensitive credentials or tokens leak into logs.`
- **Agent Workflow**:
  1. Executes test suites and validates all PRD acceptance criteria pass.
  2. Generates `docs/reviews/REVIEW-user-auth.md` using [`ai-sdlc/templates/REVIEW_CHECKLIST.md`](ai-sdlc/templates/REVIEW_CHECKLIST.md).
  3. Scans for injection flaws, IDOR vulnerabilities, and unhandled boundary cases.
- **Milestone Sign-off**:
  1. Update living memory in [`ai-sdlc/memory/project-context.md`](ai-sdlc/memory/project-context.md) with the new feature and any discovered repository quirks.
  2. Open a Pull Request using the pre-configured [`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md).

---

## ⚡ Cross-Tool Quick Reference

| Feature | Cursor | Claude Code | Antigravity / Gemini | Windsurf | Roo Code / Cline |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Persona Trigger** | `@pm`, `@architect`, `@dev`, `@qa`, `@security` | `/pm`, `/architect`, `/dev`, `/qa`, `/security` | `@pm`, `/dev`, or `@ai-sdlc` skill | `@pm`, `@architect`, `@dev` | Switch Mode dropdown (PM, Arch, Dev, QA, Sec) |
| **Living Memory** | `project-context.md` | `project-context.md` | `project-context.md` | `project-context.md` | `project-context.md` |
| **Integrity Check** | Terminal command | Terminal command | Terminal command | Terminal command | Terminal command |

---

## 📜 License
MIT License. Free to use and adapt in open source and proprietary projects.
