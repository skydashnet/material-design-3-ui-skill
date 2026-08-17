$ErrorActionPreference = "Stop"
$SkillId = "material-design-3-ui"
$HomeDir = [Environment]::GetFolderPath("UserProfile")
$OpenClawRoot = if ($env:OPENCLAW_STATE_DIR) { $env:OPENCLAW_STATE_DIR } else { Join-Path $HomeDir ".openclaw" }

$destinations = @(
    (Join-Path $HomeDir ".claude\skills\$SkillId"),
    (Join-Path $HomeDir ".agents\skills\$SkillId"),
    (Join-Path $HomeDir ".gemini\config\skills\$SkillId"),
    (Join-Path $HomeDir ".kiro\skills\$SkillId"),
    (Join-Path $HomeDir ".config\opencode\skills\$SkillId"),
    (Join-Path $HomeDir ".hermes\skills\$SkillId"),
    (Join-Path $OpenClawRoot "skills\$SkillId")
)

Write-Host "Removing Material Design 3 UI Skill..."
foreach ($dest in $destinations) {
    if (Test-Path -LiteralPath $dest) {
        Remove-Item -LiteralPath $dest -Recurse -Force
        Write-Host "  removed $dest"
    }
}
Write-Host "Done."
