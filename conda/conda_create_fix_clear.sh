#!/usr/bin/env bash

ENV_PATH="$1"
shift

if [ -z "$ENV_PATH" ]; then
  echo "Error: env path is required (for --prefix arg in conda create command)"
  exit 1
fi

conda create --prefix "$ENV_PATH" "$@"
if [ $? -ne 0 ]; then
  echo "Failed to run conda create --prefix $ENV_PATH $@"
  exit 1
fi

# Activate
HOOK_DIR_A="${ENV_PATH}/etc/conda/activate.d"
mkdir -p "$HOOK_DIR_A"

cat > "${HOOK_DIR_A}/fix_clear.sh" << 'EOF'
#!/usr/bin/env bash
if [ -f "${CONDA_PREFIX}/bin/clear" ]; then
  mv "${CONDA_PREFIX}/bin/clear" "${CONDA_PREFIX}/bin/clear.bak"
fi
EOF

chmod +x "${HOOK_DIR_A}/fix_clear.sh"

# Deactivate
HOOK_DIR_D="${ENV_PATH}/etc/conda/deactivate.d"
mkdir -p "$HOOK_DIR_D"

cat > "${HOOK_DIR_D}/fix_clear.sh" << 'EOF'
#!/usr/bin/env bash
if [ -f "${CONDA_PREFIX}/bin/clear" ]; then
  mv "${CONDA_PREFIX}/bin/clear.bak" "${CONDA_PREFIX}/bin/clear"
fi
EOF

chmod +x "${HOOK_DIR_D}/fix_clear.sh"

