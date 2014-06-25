defmodule Hello.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :hello
  get "/", Hello.Controllers.Pages, :index, as: :page
end
