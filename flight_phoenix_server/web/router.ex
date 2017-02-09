defmodule HipmunkKelley.Router do
  use HipmunkKelley.Web, :router

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

  scope "/", HipmunkKelley do
    pipe_through :browser # Use the default browser stack

    #get "/", PageController, :index

    get "/flights/search", SearchController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HipmunkKelley do
  #   pipe_through :api
  # end
end
