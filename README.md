# The Tavern

[![Build Status](https://travis-ci.org/bannmoore/the_tavern.svg?branch=master)](https://travis-ci.org/bannmoore/the_tavern)

## Getting Started

First-time setup:

```sh
bin/setup.sh

mix deps.get
(cd apps/the_tavern_web && npm insall --prefix assets)

docker-compose up -d
mix ecto.create
```

Start the server:

```sh
mix phx.server
```

Run tests:

```sh
mix test
# or
mix test.watch # for TDD
```

## Deployment

This app is configured for deployment on Heroku, using the following buildpacks:

1. [Elixir Buildpack](https://github.com/HashNuke/heroku-buildpack-elixir)
2. [Phoenix Static Buildpack](https://github.com/gjaldon/heroku-buildpack-phoenix-static)

After deploying code that adds migrations, use this command to run the migrations on the Heroku Postgres:

```
heroku run "POOL_SIZE=2 mix ecto.migrate"
```
