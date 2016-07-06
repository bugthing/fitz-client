defmodule FitzClient do
  #use Application.Behaviour

  ## See http://elixir-lang.org/docs/stable/elixir/Application.html
  ## for more information on OTP Applications
  #def start(_type, _args) do
  #  FitzClient.Supervisor.start_link
  #end

  def main(args) do
    args |> parse_args |> do_process
  end

  def parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [user: :string, page: :integer, page_index: :integer]
    )

    options

    #case options do
    #  {[user: '', page: 1, page_size: 100], _, _} -> [user: user, page: page, page_size: page_size]
    #  {[help: true], _, _} -> :help
    #  _ -> :help
    #end
  end

  def do_process([user: user, page: page, page_size: page_size]) do
    IO.puts "Use: #{page} -- #{page} -- #{page_size}"
  end

  def do_process(:help) do
    IO.puts """
      Usage:
      ./fitz_client --page [page number]

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
