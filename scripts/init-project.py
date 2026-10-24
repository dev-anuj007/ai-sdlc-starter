#!/usr/bin/env python3
"""
AI-SDLC Project Initializer (Python Standard Library - Zero Dependencies)

Quickly customizes the AI-SDLC boilerplate for a new project by updating
living memory and tool configuration files with your project's name,
tech stack, package manager, and test/lint commands.
Idempotent: safe to run multiple times to update settings.

Usage:
    python scripts/init-project.py
    python scripts/init-project.py --name "My App" --stack "TypeScript" --test "npm test" --lint "npm run lint"
"""

import sys
import re
import argparse
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent.parent
CONTEXT_FILE = ROOT_DIR / "ai-sdlc" / "memory" / "project-context.md"
CLAUDE_FILE = ROOT_DIR / "CLAUDE.md"


def init_project(name, description, stack, test_cmd, lint_cmd, build_cmd="npm run build"):
    print(f"[*] Initializing AI-SDLC template for project: {name}")

    # 1. Update project-context.md (Idempotent regex matching)
    if CONTEXT_FILE.is_file():
        content = CONTEXT_FILE.read_text(encoding="utf-8")
        content = re.sub(r"^- \*\*Project Name\*\*:.*$", f"- **Project Name**: {name}", content, flags=re.MULTILINE)
        content = re.sub(r"^- \*\*Purpose\*\*:.*$", f"- **Purpose**: {description}", content, flags=re.MULTILINE)
        content = re.sub(r"^- \*\*Primary Tech Stack\*\*:.*$", f"- **Primary Tech Stack**: {stack}", content, flags=re.MULTILINE)
        content = re.sub(r"^- \*\*Testing Command\*\*:.*$", f"- **Testing Command**: `{test_cmd}`", content, flags=re.MULTILINE)
        content = re.sub(r"^- \*\*Linting & Formatting\*\*:.*$", f"- **Linting & Formatting**: `{lint_cmd}`", content, flags=re.MULTILINE)
        CONTEXT_FILE.write_text(content, encoding="utf-8")
        print(f"  ✓ Updated {CONTEXT_FILE.relative_to(ROOT_DIR)}")

    # 2. Update CLAUDE.md (Idempotent regex matching)
    if CLAUDE_FILE.is_file():
        content = CLAUDE_FILE.read_text(encoding="utf-8")
        content = re.sub(r"(# Build\r?\n)[^\r\n]+", rf"\g<1>{build_cmd}", content)
        content = re.sub(r"(# Test\r?\n)[^\r\n]+", rf"\g<1>{test_cmd}", content)
        content = re.sub(r"(# Lint & Format\r?\n)[^\r\n]+", rf"\g<1>{lint_cmd}", content)
        CLAUDE_FILE.write_text(content, encoding="utf-8")
        print(f"  ✓ Updated {CLAUDE_FILE.relative_to(ROOT_DIR)}")

    print(f"\n[SUCCESS] AI-SDLC configuration initialized for '{name}'!")
    print("Run your rule verification at any time: python scripts/sync-rules.py --check")


def main():
    parser = argparse.ArgumentParser(description="Initialize AI-SDLC Boilerplate for a new project")
    parser.add_argument("--name", help="Project name")
    parser.add_argument("--desc", help="Project description", default="A modern application governed by AI-SDLC")
    parser.add_argument("--stack", help="Primary tech stack (e.g. TypeScript, Python, Go)", default="Polyglot")
    parser.add_argument("--test", help="Test command (e.g. npm test, pytest)", default="npm test")
    parser.add_argument("--lint", help="Lint command (e.g. npm run lint, ruff check .)", default="npm run lint")
    parser.add_argument("--build", help="Build command (e.g. npm run build, cargo build)", default="npm run build")

    args = parser.parse_args()

    if args.name:
        init_project(args.name, args.desc, args.stack, args.test, args.lint, args.build)
    else:
        # Check if stdin is interactive
        if not sys.stdin.isatty():
            init_project("My Project", args.desc, args.stack, args.test, args.lint, args.build)
            return

        # Interactive mode
        print("=== AI-SDLC Project Quickstart ===")
        name = input("Project Name (default: My Project): ").strip() or "My Project"
        desc = input("Project Description: ").strip() or "A modern application governed by AI-SDLC"
        stack = input("Primary Tech Stack (e.g., TypeScript, Python, Rust): ").strip() or "TypeScript"
        test_cmd = input("Test Command (default: npm test): ").strip() or "npm test"
        lint_cmd = input("Lint Command (default: npm run lint): ").strip() or "npm run lint"
        build_cmd = input("Build Command (default: npm run build): ").strip() or "npm run build"

        init_project(name, desc, stack, test_cmd, lint_cmd, build_cmd)


if __name__ == "__main__":
    main()
