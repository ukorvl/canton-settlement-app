# canton-settlement-app

Minimal pnpm workspace scaffold for learning Canton and Daml.

## Layout

- `apps/api` for the service layer that can submit commands to Canton and expose data to clients.
- `apps/web` for the browser UI.
- `packages/daml-model` for the hand-written Daml model and ledger templates.
- `packages/daml-generated` for code generated from Daml artifacts for TypeScript apps.
- `packages/shared` for plain shared TypeScript utilities and types.
- `docs/notes` for learning notes and design decisions.
- `docs/diagrams` for architecture and workflow diagrams.
- `scripts` for helper scripts used during local development.
