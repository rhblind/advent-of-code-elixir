defmodule AdventOfCode.Year2022.Day1 do
  @moduledoc """

  [Problem description](https://adventofcode.com/2022/day/1)
  """

  @doc """
  Find the Elf carrying the most calories
  """
  def part1(input) when is_binary(input) do
    Enum.max(chunk_input(input))
  end

  @doc """
  Find the top 3 Elves carrying the most calories and
  figure out total amount of calories.
  """
  def part2(input) do
    Enum.sort(chunk_input(input), &(&1 > &2))
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp chunk_input(input) when is_binary(input) do
    String.split(input, "\n")
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.reduce([], fn
      [""], acc -> [0 | acc]
      list, acc -> [Enum.map(list, &String.to_integer/1) |> Enum.sum() | acc]
    end)
  end
end
