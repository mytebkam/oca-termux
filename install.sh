#!/usr/bin/env bash
# installs `oca` into $PREFIX/bin (Termux) or ~/.local/bin (fallback)
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -n "${PREFIX:-}" ] && [ -d "${PREFIX}/bin" ]; then
  DEST="${PREFIX}/bin"
else
  DEST="${HOME}/.local/bin"
  mkdir -p "$DEST"
fi

cp "$SRC_DIR/oca" "$DEST/oca"
chmod +x "$DEST/oca"

echo "installed oca -> $DEST/oca"

case ":$PATH:" in
  *":$DEST:"*) ;;
  *) echo "NOTE: $DEST is not on your PATH. Add this to your ~/.bashrc or ~/.zshrc:"
     echo "  export PATH=\"$DEST:\$PATH\"" ;;
esac

echo
echo "Next steps:"
echo "  oca setup     # install opencode + base tools"
echo "  cd your-project && oca   # launch the agent"
