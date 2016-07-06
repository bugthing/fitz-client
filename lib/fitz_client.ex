defmodule FitzClient do
  #use Application.Behaviour

  ## See http://elixir-lang.org/docs/stable/elixir/Application.html
  ## for more information on OTP Applications
  #def start(_type, _args) do
  #  FitzClient.Supervisor.start_link
  #end

  def main(args) do
    args |> parse_args |> do_process |> do_request
  end

  def parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [user: :string, page: :integer, page_size: :integer]
    )
    case options do
      [user: user, page: page, page_size: page_size] -> [user: user, page: page, page_size: page_size]
      _ -> :help
    end
  end

  def do_process([user: user, page: page, page_size: page_size]) do
    IO.puts "Use: #{page} -- #{page} -- #{page_size}"
     [user, page, page_size]
  end

  def do_request([user, page, page_size]) do
    HTTPoison.start
	res = HTTPoison.get! "http://fizzbuzz.127-0-0-1.org.uk:3000/fizz?user_id=#{user}&page=#{page}&page_size=#{page_size}"
    IO.puts "REQ: User: #{user} Page: #{page} Size: #{page_size} -- #{res.body}"
  end

  def do_process(:help) do
    IO.puts """
      Usage:
      ./fitz_client --user [user id] --page [page number] --page-size [number of results per page]

      Options:
      --user      Provide a user id
      --page      Page number to return
      --page-size Page size to return

      --help  Show this help message.
      Description:
      Client to fizz buzz api
    """
    System.halt(0)
  end
end
