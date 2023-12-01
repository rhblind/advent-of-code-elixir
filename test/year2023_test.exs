defmodule AdventOfCode.Year2023 do
  use ExUnit.Case, async: true
  alias TestHelper.Fixture

  alias AdventOfCode.Year2023.{Day1}

  describe "Day 1" do
    setup do
      {:ok, %{input: Fixture.read("2023_day1.txt")}}
    end

    test "find the calibration value for the trebuchet", %{input: input} do
      assert 52974 = Day1.part1(input)
    end
  end
end
