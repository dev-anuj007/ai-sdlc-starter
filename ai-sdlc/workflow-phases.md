# AI-SDLC Lifecycle Workflow Phases

The AI Software Development Life Cycle (AI-SDLC) divides software engineering into five distinct, verifiable phases. Each phase can be executed by specialized agent personas or invoked via slash commands/prompts.

```
┌─────────────────┐      ┌─────────────────┐      ┌─────────────────┐
│   Phase 1: PRD  │ ───► │ Phase 2: Arch   │ ───► │  Phase 3: Plan  │
│ Product Manager │      │ System Architect│      │ Task Breakdown  │
└─────────────────┘      └─────────────────┘      └─────────────────┘
                                                           │
                                                           ▼
┌─────────────────┐                               ┌─────────────────┐
│  Phase 5: Audit │ ◄──────────────────────────── │ Phase 4: Build  │
│  QA & Security  │        Verification Loop      │ Senior Developer│
└─────────────────┘                               └─────────────────┘
```

---

## Phase 1: Requirements & Problem Formulation (PRD)
**Lead Persona**: `Product Manager` (`@pm`, `/pm`)  
**Artifact**: `docs/prd/PRD-<feature>.md` (from `ai-sdlc/templates/PRD_TEMPLATE.md`)

- **Objective**: Clarify ambiguity, define user personas, problem statement, core use cases, acceptance criteria, and explicit non-goals.
- **Agent Behavior**:
  - Asks targeted clarifying questions before assuming edge case behaviors.
  - Produces measurable acceptance criteria (Given / When / Then).
  - Explicitly documents constraints, non-functional requirements, and out-of-scope items.

---

## Phase 2: Architectural Design & Technical Spike
**Lead Persona**: `System Architect` (`@architect`, `/architect`)  
**Artifact**: `docs/adr/ADR-<number>-<title>.md` (from `ai-sdlc/templates/ADR_TEMPLATE.md`)

- **Objective**: Design scalable, maintainable architectures, data models, and API interfaces. Evaluate trade-offs.
- **Agent Behavior**:
  - Evaluates at least 2 alternate approaches before recommending a solution.
  - Documents data structures, API contracts, boundary interactions, and state flows.
  - Considers scalability, backward compatibility, and error handling regimes.

---

## Phase 3: Task Breakdown & Execution Plan
**Lead Persona**: `System Architect` / `Lead Developer`  
**Artifact**: `docs/specs/SPEC-<feature>.md` (from `ai-sdlc/templates/SPEC_TEMPLATE.md`)

- **Objective**: Break the architecture into bite-sized, sequentially executable tasks.
- **Agent Behavior**:
  - Each task must have clear inputs, expected file paths, and verifiable completion criteria.
  - Tasks are ordered to allow incremental builds and early testing.
  - Formatted as markdown checkboxes `[ ]` for progress tracking.

---

## Phase 4: Implementation & Test-Driven Development
**Lead Persona**: `Senior Developer` (`@dev`, `/dev`)  
**Artifacts**: Source code and automated tests

- **Objective**: Implement each task surgically with corresponding tests.
- **Agent Behavior**:
  - Adheres strictly to the task plan.
  - Writes tests first or in tandem with business logic.
  - Keeps code modular, readable, self-documenting, and typed.
  - Avoids premature optimization or unnecessary abstraction layers.

---

## Phase 5: Verification, QA & Security Review
**Lead Personas**: `QA Engineer` (`@qa`, `/qa`) & `Security Auditor` (`@security`, `/security`)  
**Artifact**: `docs/reviews/REVIEW-<feature>.md` (from `ai-sdlc/templates/REVIEW_CHECKLIST.md`)

- **Objective**: Validate functional correctness, edge case resilience, and security posture.
- **Agent Behavior**:
  - **QA**: Tests boundary conditions, null/empty values, error branches, and regression risks.
  - **Security**: Scans for OWASP Top 10 vulnerabilities, credential leakage, unsafe deserialization, and injection risks.
  - Produces an actionable remediation checklist before sign-off.
