defmodule GameTest do
  use ExUnit.Case

  @mock_grid [
                [:green, :green, :green, :green, :green, :black, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :black, :black, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :black, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:black, :black, :black, :black, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :black],
                [:green, :green, :green, :green, :black, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :black, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
             ]

  @final_grid [
                [nil   , nil   , nil   , nil   , nil   , nil   , :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, nil   , nil   , nil   , :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :black],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
                [:green, :green, :green, :green, :green, :black, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green, :green],
             ]

  test "start the game with randomly placed coins on a 20x20 grid" do
    grid = Game.begin
    assert grid |> length == 20
    assert grid |> List.first |> length == 20
    coin_at_the_first_box = grid |> List.first |> List.first
    index = Enum.find_index Game.coins, fn(x) -> x == coin_at_the_first_box end
    assert index != nil
  end

  test "when the user selects a box game should look for the cluster, empty it and fill coins from the top and calculate the score" do
    [grid, score] = Game.select_box([3, 3], @mock_grid)
    assert grid   == @final_grid
    assert score  == 16.2
  end
end
