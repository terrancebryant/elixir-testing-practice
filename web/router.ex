defmodule Testing.Router do
  use Testing.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    resources "/bots", Testing.BotController
  end

  scope "/", Testing do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  scope "/api", Testing do
    pipe_through :api
    resources "/bots", BotController
  end
end
