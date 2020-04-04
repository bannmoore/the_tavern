# The Tavern

## Getting Started

First-time setup:

```sh
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