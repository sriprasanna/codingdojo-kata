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
    do_randomly_place_coin_on_the_grid_at(0, 0, grid)
  end

  defp do_build_grid(20, grid), do: grid

  defp do_build_grid(index, grid) do
    do_build_grid index + 1, List.insert_at(grid, index, [])
  end

  defp do_randomly_place_coin_on_the_grid_at(_x, 20, grid), do: grid

  defp do_randomly_place_coin_on_the_grid_at(20, y, grid) do
    do_randomly_place_coin_on_the_grid_at 0, y + 1, grid
  end

  defp do_randomly_place_coin_on_the_grid_at(x, y, grid) do
    row = Enum.at(grid, y) |> List.insert_at x, random_coin
    grid = List.replace_at grid, y, row
    do_randomly_place_coin_on_the_grid_at x + 1, y, grid
  end


  defp random_coin do
    :random.uniform(length(@coins)) |> :lists.nth @coins
  end

  @doc """
    Select the box from the user input. Find the cluster based on the coin selected, empty the cluster and fill coins from the top.
    Returns new grid and the score.
  """
  def select_box([x, y], grid) do
    coin_selected = coin_at [x, y], grid
    cluster = do_find_adjacent_same_colored_coins([x, y], coin_selected, grid, []) |> Enum.sort
    do_calculate_score_and_rearrange_grid(cluster, grid)
  end

  defp coin_at([x, y], grid) do
    Enum.at(grid, y) |> Enum.at x
  end

  defp do_find_adjacent_same_colored_coins([x, y], coin_selected, grid, cluster) do
    cluster = do_find_cluster([x + 1, y + 1], coin_selected, grid, cluster)
    cluster = do_find_cluster([x + 1, y + 0], coin_selected, grid, cluster)
    cluster = do_find_cluster([x + 1, y - 1], coin_selected, grid, cluster)
    cluster = do_find_cluster([x + 0, y + 1], coin_selected, grid, cluster)
    cluster = do_find_cluster([x + 0, y + 0], coin_selected, grid, cluster)
    cluster = do_find_cluster([x + 0, y - 1], coin_selected, grid, cluster)
    cluster = do_find_cluster([x - 1, y + 1], coin_selected, grid, cluster)
    cluster = do_find_cluster([x - 1, y + 0], coin_selected, grid, cluster)
    do_find_cluster([x - 1, y - 1], coin_selected, grid, cluster)
  end

  defp do_find_cluster([x, y], coin_selected, grid, cluster) do
    coin = coin_at [x, y], grid
    index = Enum.find_index cluster, fn(i) -> i == [x, y] end
    if coin_selected == coin and !index, do: do_find_adjacent_same_colored_coins([x, y], coin_selected, grid, [[x, y] | cluster]), else: cluster
  end

  defp do_calculate_score_and_rearrange_grid(cluster, grid) do
    score = do_calculate_score(cluster)
    new_grid = do_rearrange_grid(cluster, grid)
    [new_grid, score]
  end

  defp do_calculate_score(cluster) do
    length_of_cluster = length(cluster)
    multiply_by = cond do
                    length_of_cluster > 10 -> 2
                    length_of_cluster > 6 -> 1.8
                    length_of_cluster > 4 -> 1.5
                    length_of_cluster > 2 -> 1.2
                    true -> 1
                  end
    length_of_cluster * multiply_by
  end

  defp do_rearrange_grid([], grid), do: grid

  defp do_rearrange_grid([[x, y] | cluster], grid) do
    grid = do_place_coin_on_the_grid_at [x, y], grid, nil
    grid = do_fill_coins_from_top [x, y], grid
    do_rearrange_grid cluster, grid
  end

  defp do_place_coin_on_the_grid_at([x, y], grid, coin) do
    row = Enum.at(grid, y) |> List.replace_at x, coin
    List.replace_at grid, y, row
  end

  defp do_fill_coins_from_top([x, 0], grid) do
    do_place_coin_on_the_grid_at([x, 0], grid, nil)
  end

  defp do_fill_coins_from_top([x, y], grid) do
   grid = do_place_coin_on_the_grid_at([x, y], grid, coin_at([x, y - 1], grid))
   do_fill_coins_from_top([x, y - 1], grid)
  end

end
