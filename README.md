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
