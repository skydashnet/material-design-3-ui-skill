[CmdletBinding()]
param(
    [switch]$All,
    [switch]$Detect,
    [ValidateSet("claude","codex","antigravity","kiro","opencode","hermes","openclaw")]
    [string[]]$Agent,
    [string]$Source,
    [switch]$Link,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$Repo = "skydashnet/material-design-3-ui-skill"
$Ref = if ($env:MD3_SKILL_REF) { $env:MD3_SKILL_REF } else { "main" }
$SkillId = "material-design-3-ui"
$HomeDir = [Environment]::GetFolderPath("UserProfile")

if (-not $HomeDir) {
    throw "Could not determine the user home directory."
}

$mode = "all"
if ($Detect) { $mode = "detect" }
if ($Agent -and $Agent.Count -gt 0) { $mode = "selected" }
if ($All) { $mode = "all" }

$tempDir = $null
try {
    if (-not $Source) {
        $scriptPath = $MyInvocation.MyCommand.Path
        if ($scriptPath) {
            $candidate = Join-Path (Split-Path -Parent $scriptPath) "SKILL.md"
            if (Test-Path -LiteralPath $candidate -PathType Leaf) {
                $Source = $candidate
            }
        }
    }

    if (-not $Source) {
        if ($Link) {
            throw "--Link requires a local -Source or a cloned repository."
        }
        $tempDir = Join-Path ([IO.Path]::GetTempPath()) ("md3-skill-" + [guid]::NewGuid().ToString("N"))
        New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
        $Source = Join-Path $tempDir "SKILL.md"
        $url = "https://raw.githubusercontent.com/$Repo/$Ref/SKILL.md"
        Write-Host "Downloading SKILL.md from $Repo@$Ref..."
        Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $Source
    }

    $Source = (Resolve-Path -LiteralPath $Source).Path
    $sourceText = Get-Content -LiteralPath $Source -Raw
    if ($sourceText -notmatch '(?m)^name:\s*material-design-3-ui\s*$') {
        throw "Source does not look like the expected material-design-3-ui SKILL.md."
    }
    $sourceDir = Split-Path -Parent $Source

    function Get-Destination([string]$name) {
        switch ($name) {
            "claude"      { return Join-Path $HomeDir ".claude\skills\$SkillId" }
            "codex"       { return Join-Path $HomeDir ".agents\skills\$SkillId" }
            "antigravity" { return Join-Path $HomeDir ".gemini\config\skills\$SkillId" }
            "kiro"        { return Join-Path $HomeDir ".kiro\skills\$SkillId" }
            "opencode"    { return Join-Path $HomeDir ".config\opencode\skills\$SkillId" }
            "hermes"      { return Join-Path $HomeDir ".hermes\skills\$SkillId" }
            "openclaw" {
                $stateDir = if ($env:OPENCLAW_STATE_DIR) { $env:OPENCLAW_STATE_DIR } else { Join-Path $HomeDir ".openclaw" }
                return Join-Path $stateDir "skills\$SkillId"
            }
        }
    }

    function Test-Command([string]$name) {
        return [bool](Get-Command $name -ErrorAction SilentlyContinue)
    }

    function Test-AgentDetected([string]$name) {
        switch ($name) {
            "claude"      { return (Test-Command "claude") -or (Test-Path (Join-Path $HomeDir ".claude")) }
            "codex"       { return (Test-Command "codex") -or (Test-Path (Join-Path $HomeDir ".codex")) -or (Test-Path (Join-Path $HomeDir ".agents")) }
            "antigravity" { return (Test-Command "agy") -or (Test-Path (Join-Path $HomeDir ".gemini\config")) }
            "kiro"        { return (Test-Command "kiro-cli") -or (Test-Command "kiro") -or (Test-Path (Join-Path $HomeDir ".kiro")) }
            "opencode"    { return (Test-Command "opencode") -or (Test-Path (Join-Path $HomeDir ".config\opencode")) }
            "hermes"      { return (Test-Command "hermes") -or (Test-Path (Join-Path $HomeDir ".hermes")) }
            "openclaw" {
                $stateDir = if ($env:OPENCLAW_STATE_DIR) { $env:OPENCLAW_STATE_DIR } else { Join-Path $HomeDir ".openclaw" }
                return (Test-Command "openclaw") -or (Test-Path $stateDir)
            }
        }
    }

    $allAgents = @("claude","codex","antigravity","kiro","opencode","hermes","openclaw")
    if ($mode -eq "all") {
        $targets = $allAgents
    } elseif ($mode -eq "detect") {
        $targets = @($allAgents | Where-Object { Test-AgentDetected $_ })
    } else {
        $targets = @($Agent)
    }

    if (-not $targets -or $targets.Count -eq 0) {
        Write-Host "No supported agents detected. Re-run without -Detect or use -Agent <name>."
        exit 0
    }

    Write-Host ""
    Write-Host "Material Design 3 UI Skill"
    Write-Host "OS: Windows"
    Write-Host "Mode: $mode"
    Write-Host ""

    $seen = @{}

    foreach ($name in $targets) {
        $dest = Get-Destination $name

        if ($seen.ContainsKey($dest)) {
            Write-Host ("  {0,-12} covered by {1,-12} {2}" -f $name, $seen[$dest], $dest)
            continue
        }
        $seen[$dest] = $name

        $destSkill = Join-Path $dest "SKILL.md"

        if (Test-Path -LiteralPath $dest) {
            $same = $false
            if (Test-Path -LiteralPath $destSkill -PathType Leaf) {
                $sourceHash = (Get-FileHash -LiteralPath $Source -Algorithm SHA256).Hash
                $destHash = (Get-FileHash -LiteralPath $destSkill -Algorithm SHA256).Hash
                $same = ($sourceHash -eq $destHash)
            }

            if ($same -and -not $Link) {
                Write-Host ("  {0,-12} already up to date  {1}" -f $name, $dest)
                continue
            }

            if (-not $Force) {
                Write-Host ("  {0,-12} skipped (exists; use -Force)  {1}" -f $name, $dest)
                continue
            }

            Remove-Item -LiteralPath $dest -Recurse -Force
        }

        New-Item -ItemType Directory -Path (Split-Path -Parent $dest) -Force | Out-Null

        if ($Link) {
            try {
                New-Item -ItemType SymbolicLink -Path $dest -Target $sourceDir -Force | Out-Null
                Write-Host ("  {0,-12} linked              {1} -> {2}" -f $name, $dest, $sourceDir)
            } catch {
                throw "Could not create symbolic link at '$dest'. On Windows, enable Developer Mode or run with permission to create symlinks. $($_.Exception.Message)"
            }
        } else {
            New-Item -ItemType Directory -Path $dest -Force | Out-Null
            Copy-Item -LiteralPath $Source -Destination $destSkill -Force
            Write-Host ("  {0,-12} installed           {1}" -f $name, $dest)
        }
    }

    Write-Host ""
    Write-Host "Done."
    Write-Host "Restart an agent only if it does not detect the new skill automatically."
}
finally {
    if ($tempDir -and (Test-Path -LiteralPath $tempDir)) {
        Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}
