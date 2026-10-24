<#
.SYNOPSIS
    AI-SDLC Rule Synchronizer and Validator (Pure Windows PowerShell - Zero Dependencies)
.DESCRIPTION
    Validates and verifies that all AI-SDLC source documents and tool configs exist
    across Cursor, Claude Code, Antigravity, Gemini, Copilot, Windsurf, Cline, and Roo Code.
#>

[CmdletBinding()]
param (
    [switch]$Check
)

$RootDir = Split-Path -Parent $PSScriptRoot
$AiSdlcDir = Join-Path $RootDir "ai-sdlc"

$ExpectedFiles = @(
    (Join-Path $AiSdlcDir "core-principles.md"),
    (Join-Path $AiSdlcDir "workflow-phases.md"),
    (Join-Path $AiSdlcDir "personas\product-manager.md"),
    (Join-Path $AiSdlcDir "personas\system-architect.md"),
    (Join-Path $AiSdlcDir "personas\senior-developer.md"),
    (Join-Path $AiSdlcDir "personas\qa-engineer.md"),
    (Join-Path $AiSdlcDir "personas\security-auditor.md"),
    (Join-Path $AiSdlcDir "templates\PRD_TEMPLATE.md"),
    (Join-Path $AiSdlcDir "templates\ADR_TEMPLATE.md"),
    (Join-Path $AiSdlcDir "templates\SPEC_TEMPLATE.md"),
    (Join-Path $AiSdlcDir "templates\REVIEW_CHECKLIST.md"),
    (Join-Path $AiSdlcDir "memory\project-context.md"),
    (Join-Path $AiSdlcDir "memory\architecture-summary.md"),
    (Join-Path $RootDir "docs\README.md"),
    (Join-Path $RootDir "docs\prd\.gitkeep"),
    (Join-Path $RootDir "docs\adr\.gitkeep"),
    (Join-Path $RootDir "docs\specs\.gitkeep"),
    (Join-Path $RootDir "docs\reviews\.gitkeep")
)

$ToolConfigs = @(
    (Join-Path $RootDir "AGENTS.md"),
    (Join-Path $RootDir "GEMINI.md"),
    (Join-Path $RootDir "CLAUDE.md"),
    (Join-Path $RootDir ".claude\settings.json"),
    (Join-Path $RootDir ".claude\commands\pm.md"),
    (Join-Path $RootDir ".claude\commands\architect.md"),
    (Join-Path $RootDir ".claude\commands\dev.md"),
    (Join-Path $RootDir ".claude\commands\qa.md"),
    (Join-Path $RootDir ".claude\commands\security.md"),
    (Join-Path $RootDir ".cursorrules"),
    (Join-Path $RootDir ".cursor\rules\000-ai-sdlc-core.mdc"),
    (Join-Path $RootDir ".cursor\rules\100-persona-pm.mdc"),
    (Join-Path $RootDir ".cursor\rules\200-persona-architect.mdc"),
    (Join-Path $RootDir ".cursor\rules\300-persona-developer.mdc"),
    (Join-Path $RootDir ".cursor\rules\400-persona-qa.mdc"),
    (Join-Path $RootDir ".cursor\rules\500-persona-security.mdc"),
    (Join-Path $RootDir ".github\copilot-instructions.md"),
    (Join-Path $RootDir ".github\PULL_REQUEST_TEMPLATE.md"),
    (Join-Path $RootDir ".github\workflows\ai-sdlc-lint.yml"),
    (Join-Path $RootDir ".windsurfrules"),
    (Join-Path $RootDir ".clinerules"),
    (Join-Path $RootDir ".roomodes"),
    (Join-Path $RootDir ".agents\rules\ai-sdlc.md"),
    (Join-Path $RootDir ".agents\skills\ai-sdlc\SKILL.md")
)

function Test-Integrity {
    $missingSource = @()
    foreach ($file in $ExpectedFiles) {
        if (-not (Test-Path -Path $file)) {
            $missingSource += $file
        }
    }

    $missingTools = @()
    foreach ($file in $ToolConfigs) {
        if (-not (Test-Path -Path $file)) {
            $missingTools += $file
        }
    }

    if ($missingSource.Count -gt 0) {
        Write-Host "[ERROR] Missing source AI-SDLC documents:" -ForegroundColor Red
        foreach ($m in $missingSource) {
            Write-Host "  - $m" -ForegroundColor Red
        }
        return $false
    }

    if ($missingTools.Count -gt 0) {
        Write-Host "[WARNING] Missing AI tool configuration files:" -ForegroundColor Yellow
        foreach ($m in $missingTools) {
            Write-Host "  - $m" -ForegroundColor Yellow
        }
        return $false
    }

    return $true
}

if ($Check) {
    if (Test-Integrity) {
        Write-Host "[OK] AI-SDLC configs are verified." -ForegroundColor Green
        exit 0
    } else {
        exit 1
    }
}

Write-Host "[*] Scanning AI-SDLC repository root at: $RootDir" -ForegroundColor Cyan
if (-not (Test-Integrity)) {
    Write-Host "`n[!] Verification found missing files. Please verify or re-generate." -ForegroundColor Red
    exit 1
}

Write-Host "[SUCCESS] All AI-SDLC source documents and tool configs are present and synchronized:" -ForegroundColor Green
Write-Host "  [+] Antigravity and Gemini: AGENTS.md, GEMINI.md, .agents\rules, .agents\skills\ai-sdlc" -ForegroundColor Green
Write-Host "  [+] Claude Code: CLAUDE.md, .claude\settings.json, .claude\commands\*.md (5 slash commands)" -ForegroundColor Green
Write-Host "  [+] Cursor: .cursorrules, .cursor\rules\*.mdc (6 rules configured)" -ForegroundColor Green
Write-Host "  [+] GitHub Copilot and CI: .github\copilot-instructions.md, PR template, CI workflow" -ForegroundColor Green
Write-Host "  [+] Windsurf: .windsurfrules" -ForegroundColor Green
Write-Host "  [+] Cline and Roo Code: .clinerules, .roomodes (5 custom roles configured)" -ForegroundColor Green
Write-Host "  [+] Docs Scaffolding: docs\README.md, docs\{prd,adr,specs,reviews}\" -ForegroundColor Green
Write-Host "  [+] 5 Personas: PM, Architect, Dev, QA, Security Auditor" -ForegroundColor Green
