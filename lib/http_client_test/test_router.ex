defmodule Test.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/client/:provider" do
    send_resp(conn, 200,Test.Handler.handle(provider) |> inspect )
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
