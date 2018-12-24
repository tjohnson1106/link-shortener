defmodule ShortenWeb.Router do
  use ShortenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShortenWeb do
    pipe_through :api
    resources "/links", LinkController, except: [:edit]
  end

  scope "/", ShortenWeb do
    get "/:id", LinkController, :get_and_redirect
  end
end
