<#
.SYNOPSIS
    AI-SDLC Project Initializer (Windows PowerShell - Zero Dependencies)
.DESCRIPTION
    Quickly customizes the AI-SDLC boilerplate for a new project by updating
    project-context.md and CLAUDE.md with your project's name, stack, and commands.
    Idempotent and safe to run multiple times.
#>

[CmdletBinding()]
param (
    [string]$Name,
    [string]$Description = "A modern application governed by AI-SDLC",
    [string]$Stack = "TypeScript",
    [string]$TestCommand = "npm test",
    [string]$LintCommand = "npm run lint",
    [string]$BuildCommand = "npm run build"
)

$RootDir = Split-Path -Parent $PSScriptRoot
$ContextFile = Join-Path $RootDir "ai-sdlc\memory\project-context.md"
$ClaudeFile = Join-Path $RootDir "CLAUDE.md"

if (-not $Name) {
    # Check if host is interactive
    if ([Environment]::UserInteractive -and -not [Console]::IsInputRedirected) {
        Write-Host "=== AI-SDLC Project Quickstart ===" -ForegroundColor Cyan
        $Name = Read-Host "Project Name (default: My Project)"
        if (-not $Name) { $Name = "My Project" }

        $inputDesc = Read-Host "Project Description"
        if ($inputDesc) { $Description = $inputDesc }

        $inputStack = Read-Host "Primary Tech Stack (default: TypeScript)"
        if ($inputStack) { $Stack = $inputStack }

        $inputTest = Read-Host "Test Command (default: npm test)"
        if ($inputTest) { $TestCommand = $inputTest }

        $inputLint = Read-Host "Lint Command (default: npm run lint)"
        if ($inputLint) { $LintCommand = $inputLint }

        $inputBuild = Read-Host "Build Command (default: npm run build)"
        if ($inputBuild) { $BuildCommand = $inputBuild }
    } else {
        $Name = "My Project"
    }
}

Write-Host "[*] Initializing AI-SDLC template for project: $Name" -ForegroundColor Cyan

if (Test-Path -Path $ContextFile) {
    $content = Get-Content -Path $ContextFile -Raw -Encoding UTF8
    $content = [regex]::Replace($content, "(?m)^- \*\*Project Name\*\*:.*$", "- **Project Name**: $Name")
    $content = [regex]::Replace($content, "(?m)^- \*\*Purpose\*\*:.*$", "- **Purpose**: $Description")
    $content = [regex]::Replace($content, "(?m)^- \*\*Primary Tech Stack\*\*:.*$", "- **Primary Tech Stack**: $Stack")
    $content = [regex]::Replace($content, "(?m)^- \*\*Testing Command\*\*:.*$", "- **Testing Command**: ``$TestCommand``")
    $content = [regex]::Replace($content, "(?m)^- \*\*Linting & Formatting\*\*:.*$", "- **Linting & Formatting**: ``$LintCommand``")
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($ContextFile, $content.TrimEnd("`r`n") + "`n", $utf8NoBom)
    Write-Host "  [+] Updated ai-sdlc\memory\project-context.md" -ForegroundColor Green
}

if (Test-Path -Path $ClaudeFile) {
    $content = Get-Content -Path $ClaudeFile -Raw -Encoding UTF8
    $content = [regex]::Replace($content, "(# Build\r?\n)[^\r\n]+", "`$1$BuildCommand")
    $content = [regex]::Replace($content, "(# Test\r?\n)[^\r\n]+", "`$1$TestCommand")
    $content = [regex]::Replace($content, "(# Lint & Format\r?\n)[^\r\n]+", "`$1$LintCommand")
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($ClaudeFile, $content.TrimEnd("`r`n") + "`n", $utf8NoBom)
    Write-Host "  [+] Updated CLAUDE.md" -ForegroundColor Green
}

Write-Host "`n[SUCCESS] AI-SDLC configuration initialized for '$Name'!" -ForegroundColor Green
Write-Host "Run rule verification at any time: powershell -ExecutionPolicy Bypass -File scripts\sync-rules.ps1 -Check" -ForegroundColor Cyan
