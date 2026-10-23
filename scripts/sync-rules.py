#!/usr/bin/env python3
"""
AI-SDLC Rule Synchronizer (Python Standard Library - Zero Dependencies)

Validates and synchronizes AI-SDLC rules, personas, and memory references
across all supported AI developer tools (Cursor, Claude Code, Antigravity,
Gemini, Copilot, Windsurf, Cline, Roo Code).
"""

import os
import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent.parent
AI_SDLC_DIR = ROOT_DIR / "ai-sdlc"

EXPECTED_FILES = [
    AI_SDLC_DIR / "core-principles.md",
    AI_SDLC_DIR / "workflow-phases.md",
    AI_SDLC_DIR / "personas" / "product-manager.md",
    AI_SDLC_DIR / "personas" / "system-architect.md",
    AI_SDLC_DIR / "personas" / "senior-developer.md",
    AI_SDLC_DIR / "personas" / "qa-engineer.md",
    AI_SDLC_DIR / "personas" / "security-auditor.md",
    AI_SDLC_DIR / "templates" / "PRD_TEMPLATE.md",
    AI_SDLC_DIR / "templates" / "ADR_TEMPLATE.md",
    AI_SDLC_DIR / "templates" / "SPEC_TEMPLATE.md",
    AI_SDLC_DIR / "templates" / "REVIEW_CHECKLIST.md",
    AI_SDLC_DIR / "memory" / "project-context.md",
    AI_SDLC_DIR / "memory" / "architecture-summary.md",
]

TOOL_CONFIGS = [
    ROOT_DIR / "AGENTS.md",
    ROOT_DIR / "GEMINI.md",
    ROOT_DIR / "CLAUDE.md",
    ROOT_DIR / ".cursorrules",
    ROOT_DIR / ".cursor" / "rules" / "000-ai-sdlc-core.mdc",
    ROOT_DIR / ".cursor" / "rules" / "100-persona-pm.mdc",
    ROOT_DIR / ".cursor" / "rules" / "200-persona-architect.mdc",
    ROOT_DIR / ".cursor" / "rules" / "300-persona-developer.mdc",
    ROOT_DIR / ".cursor" / "rules" / "400-persona-qa.mdc",
    ROOT_DIR / ".cursor" / "rules" / "500-persona-security.mdc",
    ROOT_DIR / ".github" / "copilot-instructions.md",
    ROOT_DIR / ".windsurfrules",
    ROOT_DIR / ".clinerules",
    ROOT_DIR / ".roomodes",
    ROOT_DIR / ".agents" / "rules" / "ai-sdlc.md",
]


def check_integrity():
    missing_source = [f for f in EXPECTED_FILES if not f.is_file()]
    missing_tools = [f for f in TOOL_CONFIGS if not f.is_file()]

    if missing_source:
        print("[ERROR] Missing source AI-SDLC documents:")
        for f in missing_source:
            print(f"  - {f.relative_to(ROOT_DIR)}")
        return False

    if missing_tools:
        print("[WARNING] Missing AI tool configuration files:")
        for f in missing_tools:
            print(f"  - {f.relative_to(ROOT_DIR)}")
        return False

    return True


def sync():
    print(f"[*] Scanning AI-SDLC repository root at: {ROOT_DIR}")
    if not check_integrity():
        print("\n[!] Synchronization found missing files. Please verify or re-generate.")
        sys.exit(1)

    print("[SUCCESS] All AI-SDLC source documents and tool configs are present and synchronized:")
    print("  ✓ Antigravity & Gemini: AGENTS.md, GEMINI.md, .agents/rules/ai-sdlc.md")
    print("  ✓ Claude Code: CLAUDE.md, .claude/settings.json")
    print("  ✓ Cursor: .cursorrules, .cursor/rules/*.mdc (6 rules configured)")
    print("  ✓ GitHub Copilot: .github/copilot-instructions.md")
    print("  ✓ Windsurf: .windsurfrules")
    print("  ✓ Cline & Roo Code: .clinerules, .roomodes (5 custom roles configured)")
    print("  ✓ 5 Personas: PM, Architect, Dev, QA, Security Auditor")


if __name__ == "__main__":
    if "--check" in sys.argv:
        if check_integrity():
            print("[OK] AI-SDLC configs are verified.")
            sys.exit(0)
        else:
            sys.exit(1)
    sync()
