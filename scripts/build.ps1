# Build Rental API + Angular SPA.
param(
    [ValidateSet('Debug', 'Release')]
    [string]$Configuration = 'Debug'
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent

Write-Host '=== Building Rental API ===' -ForegroundColor Cyan
dotnet build (Join-Path $repoRoot 'Aganox.Rental.sln') -c $Configuration
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host '=== Building Rental Web ===' -ForegroundColor Cyan
Push-Location (Join-Path $repoRoot 'src\aganox-rental-web')
try {
    if (-not (Test-Path 'node_modules')) {
        npm ci
        if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    }
    npm run build
    exit $LASTEXITCODE
}
finally {
    Pop-Location
}
