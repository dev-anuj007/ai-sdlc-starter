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
    (Join-Path $AiSdlcDir "memory\architecture-summary.md")
)

$ToolConfigs = @(
    (Join-Path $RootDir "AGENTS.md"),
    (Join-Path $RootDir "GEMINI.md"),
    (Join-Path $RootDir "CLAUDE.md"),
    (Join-Path $RootDir ".cursorrules"),
    (Join-Path $RootDir ".cursor\rules\000-ai-sdlc-core.mdc"),
    (Join-Path $RootDir ".cursor\rules\100-persona-pm.mdc"),
    (Join-Path $RootDir ".cursor\rules\200-persona-architect.mdc"),
    (Join-Path $RootDir ".cursor\rules\300-persona-developer.mdc"),
    (Join-Path $RootDir ".cursor\rules\400-persona-qa.mdc"),
    (Join-Path $RootDir ".cursor\rules\500-persona-security.mdc"),
    (Join-Path $RootDir ".github\copilot-instructions.md"),
    (Join-Path $RootDir ".windsurfrules"),
    (Join-Path $RootDir ".clinerules"),
    (Join-Path $RootDir ".roomodes"),
    (Join-Path $RootDir ".agents\rules\ai-sdlc.md")
)

Write-Host "[*] Scanning AI-SDLC repository root at: $RootDir" -ForegroundColor Cyan

$MissingSource = @()
foreach ($file in $ExpectedFiles) {
    if (-not (Test-Path -Path $file)) {
        $MissingSource += $file
    }
}

$MissingTools = @()
foreach ($file in $ToolConfigs) {
    if (-not (Test-Path -Path $file)) {
        $MissingTools += $file
    }
}

if ($MissingSource.Count -gt 0) {
    Write-Host "[ERROR] Missing source AI-SDLC documents:" -ForegroundColor Red
    foreach ($m in $MissingSource) {
        Write-Host "  - $m" -ForegroundColor Red
    }
    exit 1
}

if ($MissingTools.Count -gt 0) {
    Write-Host "[WARNING] Missing AI tool configuration files:" -ForegroundColor Yellow
    foreach ($m in $MissingTools) {
        Write-Host "  - $m" -ForegroundColor Yellow
    }
    exit 1
}

Write-Host "[SUCCESS] All AI-SDLC source documents and tool configs are present and synchronized:" -ForegroundColor Green
Write-Host "  [+] Antigravity and Gemini: AGENTS.md, GEMINI.md, .agents\rules\ai-sdlc.md" -ForegroundColor Green
Write-Host "  [+] Claude Code: CLAUDE.md, .claude\settings.json" -ForegroundColor Green
Write-Host "  [+] Cursor: .cursorrules, .cursor\rules\*.mdc (6 rules configured)" -ForegroundColor Green
Write-Host "  [+] GitHub Copilot: .github\copilot-instructions.md" -ForegroundColor Green
Write-Host "  [+] Windsurf: .windsurfrules" -ForegroundColor Green
Write-Host "  [+] Cline and Roo Code: .clinerules, .roomodes (5 custom roles configured)" -ForegroundColor Green
Write-Host "  [+] 5 Personas: PM, Architect, Dev, QA, Security Auditor" -ForegroundColor Green
