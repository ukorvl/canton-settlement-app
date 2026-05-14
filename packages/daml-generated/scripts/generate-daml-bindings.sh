#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GENERATED_PACKAGE_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
REPO_ROOT="$(cd "${GENERATED_PACKAGE_DIR}/../.." && pwd)"
MODEL_DIR="${REPO_ROOT}/packages/daml-model"
MODEL_CONFIG="${MODEL_DIR}/daml.yaml"
GENERATED_DIR="${GENERATED_PACKAGE_DIR}/generated"

if ! command -v dpm >/dev/null 2>&1; then
  echo "dpm is required but was not found on PATH." >&2
  exit 1
fi

model_name="$(sed -n 's/^name:[[:space:]]*//p' "${MODEL_CONFIG}" | head -n 1)"
model_version="$(sed -n 's/^version:[[:space:]]*//p' "${MODEL_CONFIG}" | head -n 1)"

if [[ -z "${model_name}" || -z "${model_version}" ]]; then
  echo "Could not read name/version from ${MODEL_CONFIG}." >&2
  exit 1
fi

dar_path="${MODEL_DIR}/.daml/dist/${model_name}-${model_version}.dar"
generated_entry_dir="${GENERATED_DIR}/${model_name}-${model_version}"

mkdir -p "${MODEL_DIR}/.daml/dist"
rm -rf "${GENERATED_DIR}"
mkdir -p "${GENERATED_DIR}"

echo "Building DAR: ${dar_path}"
dpm build --package-root "${MODEL_DIR}" --output "${dar_path}"

echo "Generating TypeScript bindings into ${GENERATED_DIR}"
dpm codegen-js "${dar_path}" -o "${GENERATED_DIR}"

if [[ ! -f "${generated_entry_dir}/lib/index.js" ]]; then
  echo "Expected generated entrypoint not found at ${generated_entry_dir}/lib/index.js" >&2
  exit 1
fi

cat > "${GENERATED_PACKAGE_DIR}/index.js" <<EOF
module.exports = require("./generated/${model_name}-${model_version}/lib/index.js");
EOF

cat > "${GENERATED_PACKAGE_DIR}/index.d.ts" <<EOF
export * from "./generated/${model_name}-${model_version}/lib/index";
EOF

echo "Generated bindings are available from ${GENERATED_PACKAGE_DIR}"
