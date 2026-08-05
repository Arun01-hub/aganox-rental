# Aganox Rental

Property rental product — ASP.NET Core WebAPI + Angular SPA, authenticated via **Aganox Identity Server**.

## Prerequisites

- .NET 10 SDK
- Node.js 20+
- **[Aganox Identity Server](../Aganox-Identity)** running at `https://localhost:7036`

## Run locally

Terminal 1 — Identity Server (separate repo):

```powershell
cd ..\Aganox-Identity
.\scripts\run.ps1
```

Terminal 2 — Rental API:

```powershell
.\scripts\run-api.ps1
```

Terminal 3 — Rental Web:

```powershell
.\scripts\run-web.ps1
```

Open `http://localhost:4200`.

## Authentication

| Setting | Value |
|---------|-------|
| Client ID | `aganox-rental` |
| Flow | Authorization Code + PKCE |
| Issuer | `https://localhost:7036` |
| Dev user | `admin@aganox.local` / `ChangeMe123!` |

## API

| Endpoint | Description |
|----------|-------------|
| `GET/POST /api/properties` | Property listings |
| `GET /api/properties/mine` | Owner listings (Bearer token) |

Default API base: `https://localhost:7241`

## UI tests (Playwright)

```powershell
cd tests\Aganox.Rental.UITests
npm ci
npx playwright install
npx playwright test
```

Configure URLs in `.env` (see `.env.example`). Identity Server must be running for auth tests.

## Solution layout

```
src/
  Aganox.Rental.WebAPI/
  Aganox.Rental.Application/
  Aganox.Rental.Domain/
  Aganox.Rental.Infrastructure/
  aganox-rental-web/          # Angular SPA
tests/Aganox.Rental.UITests/
scripts/
```

## Related repositories

| Repo | Relationship |
|------|----------------|
| [Aganox-Identity](../Aganox-Identity) | Required OIDC provider |
| [Aganox](../Aganox) (LMS) | Separate product — no dependency |
