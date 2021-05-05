defmodule ServerEx.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/health" do
    send_resp(conn, 200, "ok")
  end

  post "/" do
    {:ok, message} = ServerEx.handle_post()
    send_resp(conn, 200, Jason.encode!(message))
  end

  get "/" do
    {:ok, message} = ServerEx.handle_get()
    send_resp(conn, 200, Jason.encode!(message))
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
