defmodule BumpTrackerWeb.Router do
  use BumpTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: "*"
  end

  scope "/api", BumpTrackerWeb do
    pipe_through :api

    resources "/bumps", BumpController, except: [:new, :edit]
  end
end
