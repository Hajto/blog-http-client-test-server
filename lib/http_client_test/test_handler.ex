defmodule Test.Handler do

  def test_site, do: Application.get_env(:http_client_test, :target)

  def handle("ibrowse") do
    {:ok, '200', _, body} = :ibrowse.send_req(test_site() |> to_charlist(), [], :get)
    body
  end

  def handle("httpotion"), do: HTTPotion.get(test_site()).body
  def handle("httpoison"), do: HTTPoison.get!(test_site()).body
  def handle("hackney") do
    method = :get
    headers = []
    payload = ""
    options = []
    {:ok, _, _, client_ref} = :hackney.request(method, test_site(), headers, payload, options)
    {:ok, body} = :hackney.body(client_ref)
    body
  end
end
