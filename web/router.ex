defmodule Mongue.Router do
  use Mongue.Web, :router

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

  scope "/", Mongue do
    pipe_through :browser # Use the default browser stack

    post "/search", SearchController, :search
    get "/search", SearchController, :index

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mongue do
  #   pipe_through :api
  # end
end
