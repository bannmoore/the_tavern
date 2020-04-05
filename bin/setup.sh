#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Set up .git hooks
printf "Symlinking /hooks to .git/hooks..."
ln -s -f ../../hooks/pre-commit .git/hooks/pre-commit
printf "Done!\n"

echo "Installation completed successfully."
exit 0