defmodule Game do
  use Application.Behaviour
  @coins [:red, :blue, :green, :black]

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Game.Supervisor.start_link
  end

  @doc """
    Retuns the different coins available in list
  """
  def coins, do: @coins

  @doc """
    Begins the game by randomly placing coins on a 20x20 grid
  """
  def begin do
    do_place_coins_randomly_on_the_grid
  end

  defp do_place_coins_randomly_on_the_grid do
    grid = do_build_grid(0, [])
    do_place_coin_on_the_grid_at(0, 0, grid)
  end

  defp do_build_grid(20, grid), do: grid

  defp do_build_grid(index, grid) do
    do_build_grid index + 1, List.insert_at(grid, index, [])
  end

  defp do_place_coin_on_the_grid_at(_x, 20, grid), do: grid

  defp do_place_coin_on_the_grid_at(20, y, grid) do
    do_place_coin_on_the_grid_at 0, y + 1, grid
  end

  defp do_place_coin_on_the_grid_at(x, y, grid) do
    row = Enum.at(grid, y) |> List.insert_at x, random_coin
    grid = List.replace_at grid, y, row
    do_place_coin_on_the_grid_at x + 1, y, grid
  end

  defp random_coin do
    :random.uniform(length(@coins)) |> :lists.nth @coins
  end


end
