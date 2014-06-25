defmodule HelloWorld do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> send_resp(200, "Hello World!")
  end
end

IO.puts "Running MyPlug with Cowboy on http://localhost:4000"
Plug.Adapters.Cowboy.http HelloWorld, []
