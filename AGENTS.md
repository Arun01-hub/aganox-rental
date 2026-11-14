# Aganox Rental — agent guide

## Purpose

Property rental API + Angular SPA; auth via **Aganox Identity** (auth code + PKCE).

## Stack

- .NET 10 Web API, SQLite dev DB, Angular SPA (`src/aganox-rental-web`), Playwright UI tests.

## Layout

```
src/Aganox.Rental.WebAPI/
src/Aganox.Rental.Application|Domain|Infrastructure/
src/aganox-rental-web/
tests/Aganox.Rental.UITests/
scripts/run-api.ps1, run-web.ps1
```

## Commands

| Task | Command |
|------|---------|
| API | `.\scripts\run-api.ps1` |
| Web | `.\scripts\run-web.ps1` |
| UI tests | `cd tests\Aganox.Rental.UITests; npm ci; npx playwright test` |

Start **Aganox-Identity** first (`..\Aganox-Identity\scripts\run.ps1`).

## Configuration

| File | Notes |
|------|-------|
| `src/Aganox.Rental.WebAPI/appsettings.Development.local.json` | Optional overrides — see `*.example` |
| `tests/Aganox.Rental.UITests/.env` | Gitignored — copy from `.env.example` |

## OIDC

- Client: `aganox-rental`, issuer `https://localhost:7036`, dev user `admin@aganox.local`.