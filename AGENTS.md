# AGENTS.md

## Overview
- This repo is a `pnpm` monorepo for learning and prototyping a Canton/Daml-based settlement workflow.
- `packages/daml-model` is the main active package. It contains the Daml ledger model and the core workflow modules for cash, bond, trade, and pending settlement states.
- `packages/daml-tests` contains Daml Script tests.
- `packages/daml-generated` is reserved for generated bindings and types derived from the Daml model. Treat generated code as output, not hand-maintained source.
- `packages/shared` is for TypeScript utilities and types shared by apps.

## Project goals
- The project models a simple institutional settlement flow on Canton: propose a trade, accept it, lock cash and bonds, and move into a pending settlement state before final settlement.
- Keep the Daml model explicit. Prefer small templates and clear state transitions over abstractions.
- Model important workflow stages as separate contracts when the business meaning changes. This makes visibility, authorization, and lifecycle easier to reason about.

## Stack
- Daml (sdk v3.4.11) for the ledger model and workflow logic.
- TypeScript (v6.0.3) for API and frontend development.
- `pnpm` (v10.11.0) for monorepo management.

## How to work with this repo
