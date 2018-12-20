defmodule ShortenWeb.Router do
  use ShortenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShortenWeb do
    pipe_through :api
  end
end
