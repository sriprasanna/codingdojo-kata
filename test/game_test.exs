defmodule GameTest do
  use ExUnit.Case

  test "start the game with randomly placed coins on a 20x20 grid" do
    grid = Game.begin
    assert grid |> length == 20
    assert grid |> List.first |> length == 20
    coin_at_the_first_box = grid |> List.first |> List.first
    index = Enum.find_index Game.coins, fn(x) -> x == coin_at_the_first_box end
    assert index != nil
  end
end
