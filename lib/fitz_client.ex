defmodule FitzClient do

  @fizz_buzz_api Application.get_env(:fitz_client, :fizz_buzz_api)

  def main(args) do
    args |> parse_args |> do_process
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
    @fizz_buzz_api.fetch_game(user, page, page_size) 
    |> print_game
  end

  def do_process(:help) do
    IO.puts """
      Usage:
      ./fitz_client --user [user id] --page [page number] --page-size [number of results per page]

      Options:
      --user      Provide a user id
      --page      Page number to return
      --page-size Page size to return

      Description:
      Client for fizz buzz api
    """
    System.halt(0)
  end

  def print_game([favorites: favs, fizz_buzz: fb]) do
    IO.puts "FIZZ BUZZ:"
    Enum.each(fb, fn(numb) ->
      [i, st] = numb 
      star = if Enum.member?(favs, Integer.to_string(i)), do: ' *', else: ''
      IO.puts " #{i} === #{st}#{star}"
    end)
  end
end
