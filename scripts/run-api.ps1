# Start Rental WebAPI (requires Aganox Identity Server at https://localhost:7036).
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path $PSScriptRoot -Parent
$project = Join-Path $repoRoot 'src\Aganox.Rental.WebAPI\Aganox.Rental.WebAPI.csproj'

Push-Location (Split-Path $project -Parent)
try {
    dotnet run --launch-profile https
}
finally {
    Pop-Location
}
