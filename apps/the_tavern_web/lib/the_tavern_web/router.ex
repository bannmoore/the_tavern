defmodule TheTavernWeb.Router do
  use TheTavernWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TheTavernWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources("/character-sheets", CharacterSheetController,
      only: [:index, :new, :create, :delete, :show]
    )
  end

  # Other scopes may use custom stacks.
  # scope "/api", TheTavernWeb do
  #   pipe_through :api
  # end
end
