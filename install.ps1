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

if (-not $HomeDir) { throw "Could not determine the user home directory." }

$mode = "all"
if ($Detect) { $mode = "detect" }
if ($Agent -and $Agent.Count -gt 0) { $mode = "selected" }
if ($All) { $mode = "all" }

$tempDir = $null

function Assert-SafeRelativePath([string]$Path) {
    if ([IO.Path]::IsPathRooted($Path) -or $Path -match '(^|[\\/])\.\.([\\/]|$)') {
        throw "Unsafe path in skill-files.txt: $Path"
    }
}

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

    if ($Source) {
        $Source = (Resolve-Path -LiteralPath $Source).Path
        $packageRoot = Split-Path -Parent $Source
        $manifestPath = Join-Path $packageRoot "skill-files.txt"
        if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
            throw "skill-files.txt was not found beside local SKILL.md."
        }
    } else {
        if ($Link) { throw "-Link requires a local clone or -Source." }

        $tempDir = Join-Path ([IO.Path]::GetTempPath()) ("md3-skill-" + [guid]::NewGuid().ToString("N"))
        $packageRoot = Join-Path $tempDir "package"
        New-Item -ItemType Directory -Path $packageRoot -Force | Out-Null

        $baseUrl = "https://raw.githubusercontent.com/$Repo/$Ref"
        $manifestPath = Join-Path $packageRoot "skill-files.txt"

        Write-Host "Downloading Material Design 3 UI Skill package from $Repo@$Ref..."
        Invoke-WebRequest -UseBasicParsing -Uri "$baseUrl/skill-files.txt" -OutFile $manifestPath

        $remoteFiles = @(
            Get-Content -LiteralPath $manifestPath |
            ForEach-Object { $_.Trim() } |
            Where-Object { $_ -and -not $_.StartsWith("#") }
        )

        foreach ($rel in $remoteFiles) {
            Assert-SafeRelativePath $rel
            $out = Join-Path $packageRoot ($rel -replace '/', [IO.Path]::DirectorySeparatorChar)
            New-Item -ItemType Directory -Path (Split-Path -Parent $out) -Force | Out-Null
            Invoke-WebRequest -UseBasicParsing -Uri "$baseUrl/$rel" -OutFile $out
        }

        $Source = Join-Path $packageRoot "SKILL.md"
    }

    $sourceText = Get-Content -LiteralPath $Source -Raw
    if ($sourceText -notmatch '(?m)^name:\s*material-design-3-ui\s*$') {
        throw "Package does not contain the expected material-design-3-ui SKILL.md."
    }

    $packageFiles = @(
        Get-Content -LiteralPath $manifestPath |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -and -not $_.StartsWith("#") }
    )

    foreach ($rel in $packageFiles) {
        Assert-SafeRelativePath $rel
        $p = Join-Path $packageRoot ($rel -replace '/', [IO.Path]::DirectorySeparatorChar)
        if (-not (Test-Path -LiteralPath $p -PathType Leaf)) {
            throw "Package file missing: $rel"
        }
    }

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

    function Test-PackageSame([string]$dest) {
        if (-not (Test-Path -LiteralPath $dest)) { return $false }
        foreach ($rel in $packageFiles) {
            $src = Join-Path $packageRoot ($rel -replace '/', [IO.Path]::DirectorySeparatorChar)
            $dst = Join-Path $dest ($rel -replace '/', [IO.Path]::DirectorySeparatorChar)
            if (-not (Test-Path -LiteralPath $dst -PathType Leaf)) { return $false }
            if ((Get-FileHash -LiteralPath $src -Algorithm SHA256).Hash -ne
                (Get-FileHash -LiteralPath $dst -Algorithm SHA256).Hash) { return $false }
        }
        return $true
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
    Write-Host "Package files: $($packageFiles.Count)"
    Write-Host ""

    $seen = @{}

    foreach ($name in $targets) {
        $dest = Get-Destination $name

        if ($seen.ContainsKey($dest)) {
            Write-Host ("  {0,-12} covered by {1,-12} {2}" -f $name, $seen[$dest], $dest)
            continue
        }
        $seen[$dest] = $name

        if (Test-Path -LiteralPath $dest) {
            if ((Test-PackageSame $dest) -and -not $Link) {
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
                New-Item -ItemType SymbolicLink -Path $dest -Target $packageRoot -Force | Out-Null
                Write-Host ("  {0,-12} linked              {1} -> {2}" -f $name, $dest, $packageRoot)
            } catch {
                throw "Could not create symbolic link at '$dest'. Enable Windows Developer Mode or use appropriate privileges. $($_.Exception.Message)"
            }
        } else {
            New-Item -ItemType Directory -Path $dest -Force | Out-Null
            foreach ($rel in $packageFiles) {
                $src = Join-Path $packageRoot ($rel -replace '/', [IO.Path]::DirectorySeparatorChar)
                $dst = Join-Path $dest ($rel -replace '/', [IO.Path]::DirectorySeparatorChar)
                New-Item -ItemType Directory -Path (Split-Path -Parent $dst) -Force | Out-Null
                Copy-Item -LiteralPath $src -Destination $dst -Force
            }
            Write-Host ("  {0,-12} installed {1} files  {2}" -f $name, $packageFiles.Count, $dest)
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
