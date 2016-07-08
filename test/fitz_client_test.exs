defmodule FitzClientTest do
  use ExUnit.Case
  doctest FitzClient

  import ExUnit.CaptureIO

  test "the truth" do
    assert 1 + 1 == 2
  end

  describe "do_process/1" do
    test "outputs the game of fizz buzz" do

      expected_output = "FIZZ BUZZ:
 1 === 1
 2 === 2 *
 3 === Fizz
"
      assert capture_io(fn ->
        FitzClient.do_process([user: '123', page: 1, page_size: 3])
      end) == expected_output
    end
  end
end
