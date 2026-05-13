# canton-settlement-app

## Table of Contents

- [canton-settlement-app](#canton-settlement-app)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Development](#development)
  - [License](#license)

## Overview

This is a simple application that demonstrates [Canton](https://www.canton.network)'s settlement capabilities. It implements Canton's core idea of a shared ledger, where multiple parties can interact with each other without the need for a trusted intermediary and full visibility.

It demonstrates how Canton network can be useful for institutional players in the financial industry by providing partial privacy while maintaining full compatibility.

A common financial world problem - DvP (Delivery versus Payment) settlement of a bond trade is implemented as a use case.

## Development

This project consists of multiple parts:

- `apps/api` hosts the service layer that talks to the ledger and exposes application APIs.
- `apps/web` hosts the user-facing frontend.
- `packages/daml-model` contains the Daml modules for cash, bond, trade, and settlement workflows.
- `packages/daml-tests` contains Daml Script tests.
- `packages/daml-generated` is reserved for generated client bindings and types derived from the Daml model.
- `packages/shared` is reserved for TypeScript code shared across the API and web applications.
- `docs/notes` is for design notes, modeling decisions, and learning material.
- `docs/diagrams` is for architecture, workflow, and settlement lifecycle diagrams.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
