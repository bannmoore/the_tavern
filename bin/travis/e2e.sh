#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

(cd e2e && npm install)
mix phx.server &
(cd e2e && npm test)
kill $(jobs -p) || true

exit 0