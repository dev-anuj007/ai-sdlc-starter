# AI-SDLC Code & Security Review Checklist

- **Feature / Pull Request**: [Feature Name / PR #]
- **Reviewer Persona**: [QA Engineer / Security Auditor / Peer]
- **Date**: [YYYY-MM-DD]
- **Sign-off Status**: [Approved | Changes Requested | Blocked]

---

## 1. Functional & QA Verification
- [ ] **Acceptance Criteria**: All items from the PRD have passing automated tests.
- [ ] **Edge Cases**: Tested empty states, nulls, invalid inputs, and boundary extremes.
- [ ] **Error Handling**: Graceful error messages without application crashes.
- [ ] **Regression Risk**: Existing tests run and pass without failure.
- [ ] **Documentation**: Updated README, schemas, or API documentation where applicable.

---

## 2. Code Quality & Architectural Integrity
- [ ] **Single Responsibility**: Each function/class has one clear purpose.
- [ ] **No Dead Code**: Removed debug statements, unused imports, or leftover comments.
- [ ] **Minimal Diff**: Edits are focused strictly on the feature task (no random reformatting).
- [ ] **Naming & Readability**: Variables, functions, and files are expressively and consistently named.
- [ ] **Type Safety**: No untyped or loose dynamic types where strict types are supported.

---

## 3. Security & Vulnerability Audit (OWASP)
- [ ] **Injection Prevention**: SQL, shell commands, or HTML templates are properly escaped/parameterized.
- [ ] **Secrets & Telemetry**: Zero secrets, API tokens, passwords, or PII committed.
- [ ] **Authentication & Access Control**: Proper authorization checks on all accessible endpoints.
- [ ] **Resource Limits**: Implemented rate limits, max payload sizes, or pagination to prevent DoS.
- [ ] **Safe Dependencies**: No outdated dependencies with known critical CVEs.

---

## 4. Findings & Remediation Items
| Severity | Category | File / Line | Description & Recommendation |
|----------|----------|-------------|------------------------------|
| [High/Med/Low] | [Sec/QA/Perf] | `src/...:45` | [Issue description and suggested code fix] |

---

## 5. Final Sign-off
- **Approved by QA**: [ ] Yes / [ ] No
- **Approved by Security**: [ ] Yes / [ ] No
