# Technical Spec & Task Plan: [Feature Name]

- **Associated PRD**: `docs/prd/PRD-[feature].md`
- **Associated ADR**: `docs/adr/ADR-[number].md`
- **Target Branch**: `feat/[feature-name]`
- **Status**: [Draft | In Progress | Ready for QA | Completed]

---

## 1. Technical Overview
<!-- 2-3 paragraph summary of the technical design, data structures, and affected modules. -->

## 2. File Impact Analysis
| File Path | Action | Description of Changes |
|-----------|--------|------------------------|
| `src/core/...` | Modify / Create | [What is being added or updated] |
| `tests/...` | Create | [Unit and integration test coverage] |

---

## 3. Step-by-Step Task Checklist
<!-- Each task should be atomic, testable, and have verifiable criteria. -->

### Step 1: Foundation & Data Types
- [ ] Task 1.1: Define core types and interface contracts
  - *Files*: `src/types/...`
  - *Verification*: Typecheck passes with zero errors

### Step 2: Core Logic Implementation
- [ ] Task 2.1: Implement business logic service
  - *Files*: `src/services/...`
  - *Verification*: Unit tests pass for happy path

- [ ] Task 2.2: Implement error handling and edge cases
  - *Files*: `src/services/...`
  - *Verification*: Negative test cases cover boundary failures

### Step 3: Integration & Wiring
- [ ] Task 3.1: Connect service to API routes or CLI entry point
  - *Files*: `src/routes/...` or `src/cli/...`
  - *Verification*: End-to-end integration test passes

### Step 4: Documentation & Cleanup
- [ ] Task 4.1: Update project README or API docs
- [ ] Task 4.2: Run linter and formatting checks

---

## 4. Verification & Acceptance Criteria Matrix
| Requirement ID | Test Case | Status | Verified By |
|----------------|-----------|--------|-------------|
| REQ-01 | `tests/unit/test_feature.py::test_happy_path` | [ ] | Senior Dev |
| REQ-02 | `tests/integration/test_edge_cases.py` | [ ] | QA Engineer |
