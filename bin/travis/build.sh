#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

mix compile
mix do ecto.create, ecto.migrate
(cd apps/the_tavern_web && npm install --prefix assets)

if [ $MIX_ENV == "prod" ]; then
  (cd apps/the_tavern_web && npm run deploy --prefix assets)
fi