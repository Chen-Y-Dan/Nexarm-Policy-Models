# Git Push Script for nexarm-policy-models
# Run this after making changes to sync to GitHub

Write-Host "=== Pushing to GitHub ===" -ForegroundColor Cyan

# Uncomment and set your proxy if needed (e.g., v2rayN default port)
# $env:HTTPS_PROXY = "http://127.0.0.1:7897"
# $env:HTTP_PROXY = "http://127.0.0.1:7897"

Write-Host "Adding changes..." -ForegroundColor Yellow
git add -A

$commitMsg = Read-Host "Enter commit message (or press Enter for auto)"
if (-not $commitMsg) {
    $commitMsg = "Update $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}

git commit -m "$commitMsg"
Write-Host "Pushing to origin main..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Push successful!" -ForegroundColor Green
} else {
    Write-Host "✗ Push failed. If you're behind a proxy, uncomment the proxy lines in this script." -ForegroundColor Red
}
