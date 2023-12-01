defmodule AdventOfCode.Year2023.Day1 do
  @moduledoc """

  # Day 1: Trebutchet?!

  [Problem description](https://adventofcode.com/2023/day/1)
  """

  @doc """
  Find the first and last digit on each line, then sum them.
  """
  def part1(input) do
    String.split(input, "\n")
    |> Stream.map(&String.codepoints/1)
    |> Stream.map(fn codepoints ->
      numerics = for {number, ""} <- Enum.map(codepoints, &Integer.parse/1), do: number

      [List.first(numerics), List.last(numerics)]
      |> Enum.reject(&is_nil/1)
      |> Enum.map(&Integer.to_string/1)
      |> Enum.join()
      |> Integer.parse()
      |> case do
        {two_digit_number, ""} -> two_digit_number
        :error -> nil
      end
    end)
    |> Stream.reject(&is_nil/1)
    |> Enum.sum()
  end
end
