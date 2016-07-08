defmodule FizzBuzzHttp do
  use HTTPoison.Base

  def fetch_game(user, page, page_size) do
    url = "/fizz?user_id=#{user}&page=#{page}&page_size=#{page_size}"
    get!(url).body |> Keyword.take([:fizz_buzz, :favorites])
  end

  def process_url(path) do
    "http://fizzbuzz.127-0-0-1.org.uk:3000" <> path
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end

