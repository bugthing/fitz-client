defmodule FizzBuzzHttpTest do
  use ExUnit.Case

#  test "retrieving user" do
#    assert {:ok, response} = FizzBuzzHttp.make_request(:get, "/fizz")
#    assert %{"login" => "mwoods79"} = response.body
#    assert %{"avatar_url" => _} = response.body
#  end

#  use ExUnit.Case
#  import :meck
#
#  import FizzBuzzHttp
#
#  #test "try_me_out" do
#  #  assert try_me_out() == 2
#  #end
#
#  setup_all do
#    on_exit fn -> unload end
#    :ok
#  end
#
#  test "successful fetch from fuzzbuzz api" do
#    mock_response = {:ok,
#      body: '{ "fizz_buzz": [[1,"1"], [2,"Buzz"]]}',
#      status_code: 200
#    }
#
#    # use meck to create a mock response
#    expect(HTTPoison, :get!, fn("http://fizzbuzz.127-0-0-1.org.uk:3000/fizz?user=1") -> mock_response end)
#
#    assert FizzBuzzHttp.game == [1,2]
#  end
end
