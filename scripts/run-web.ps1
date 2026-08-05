# Start Rental Angular SPA (proxies to API; OIDC via Identity Server).
$ErrorActionPreference = 'Stop'

$webRoot = Join-Path (Split-Path $PSScriptRoot -Parent) 'src\aganox-rental-web'
Push-Location $webRoot
try {
    if (-not (Test-Path 'node_modules')) {
        npm ci
        if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    }
    npm start
}
finally {
    Pop-Location
}
