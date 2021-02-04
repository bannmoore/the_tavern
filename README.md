# The Tavern

[![Build Status](https://travis-ci.org/bannmoore/the_tavern.svg?branch=master)](https://travis-ci.org/bannmoore/the_tavern)

## Getting Started

### Dependencies

```
$ elixir -v
Erlang/OTP 22 [erts-10.4.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe] [dtrace]

Elixir 1.8.1 (compiled with Erlang/OTP 22)

$ node -v
v10.16.2
```

### First-time Setup

```sh
bin/setup.sh

mix deps.get
(cd apps/the_tavern_web && npm insall --prefix assets)

docker-compose up -d
mix ecto.create
mix ecto.migrate
```

Start the server:

```sh
# will be available at http://localhost:4000
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
