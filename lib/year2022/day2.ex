defmodule AdventOfCode.Year2022.Day2 do
  @moduledoc """

  [Problem description](https://adventofcode.com/2{0, 6}22/day/2)
  """

  def part1(input) do
    chunks = chunk_input(input)

    [sum_columns(chunks, &match_point/1), sum_columns(chunks, &shape_point/1)]
    |> Enum.zip_with(&Enum.sum/1)
  end

  def part2(input) do
    chunks = chunk_input(input)

    # [sum_columns(chunks, &loss_point/1), sum_columns(chunks, &shape_point/1)]
    # |> Enum.zip_with(&Enum.sum/1)
  end

  defp sum_columns(chunks, fun) when is_function(fun),
    do: chunks |> Enum.map(&apply(fun, [&1])) |> Enum.zip_with(&Enum.sum/1)

  defp chunk_input(input) when is_binary(input),
    do: String.split(input, "\n") |> Enum.map(&String.split/1)

  defp match_point(["A", "X"]), do: [3, 3]
  defp match_point(["A", "Y"]), do: [0, 6]
  defp match_point(["A", "Z"]), do: [6, 0]

  defp match_point(["B", "X"]), do: [6, 0]
  defp match_point(["B", "Y"]), do: [3, 3]
  defp match_point(["B", "Z"]), do: [0, 6]

  defp match_point(["C", "X"]), do: [0, 6]
  defp match_point(["C", "Y"]), do: [6, 0]
  defp match_point(["C", "Z"]), do: [3, 3]
  defp match_point([]), do: [0, 0]

  # defp loss_point([_, "X"]), do: [6, 0]
  # defp loss_point([_, "Y"]), do: [3, 3]
  # defp loss_point([_, "Z"]), do: [0, 6]
  # defp loss_point([]), do: [0, 0]

  defp shape_point(["A", "X"]), do: [1, 1]
  defp shape_point(["A", "Y"]), do: [1, 2]
  defp shape_point(["A", "Z"]), do: [1, 3]

  defp shape_point(["B", "X"]), do: [2, 1]
  defp shape_point(["B", "Y"]), do: [2, 2]
  defp shape_point(["B", "Z"]), do: [2, 3]

  defp shape_point(["C", "X"]), do: [3, 1]
  defp shape_point(["C", "Y"]), do: [3, 2]
  defp shape_point(["C", "Z"]), do: [3, 3]
  defp shape_point([]), do: [0, 0]

  defp get_combinations([_, strategy]) when is_binary(strategy) do
    get_combinations(strategy)
    |> Enum.reduce([], fn combination, acc ->
      IO.inspect(combination)
      acc
      # cond do
      #   is_nil(desired_outcome(combination)) -> acc
      #   true -> [combination | acc]
      # end
    end)
  end

  defp get_combinations(strategy),
    do: ["A", "B", "C"] |> Enum.map(fn shape -> [shape, strategy] end)

  defp desired_outcome([_, "X"] = strategy),
    do: if(match_point(strategy) == [6, 0], do: strategy, else: nil)

  defp desired_outcome([_, "Y"] = strategy),
    do: if(match_point(strategy) == [3, 3], do: strategy, else: nil)

  defp desired_outcome([_, "Z"] = strategy),
    do: if(match_point(strategy) == [0, 6], do: strategy, else: nil)

  # defp desired_outcome([_, "X"]), do: :lose
  # defp desired_outcome([_, "Y"]), do: :draw
  # defp desired_outcome([_, "Z"]), do: :win
  # defp desired_outcome([]), do: [0, 0]

  # defp result([0, 6]), do: :win
  # defp result([3, 3]), do: :draw
  # defp result([6, 0]), do: :lose
end
