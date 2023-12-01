defmodule AdventOfCode.Year2022 do
  use ExUnit.Case, async: true
  alias TestHelper.Fixture

  alias AdventOfCode.Year2022.{Day1, Day2}

  describe "Day 1" do
    setup do
      {:ok, %{input: Fixture.read("2022_day1.txt")}}
    end

    test "find elf carrying the most calories", %{input: input} do
      assert 72511 = Day1.part1(input)
    end

    test "find total amount of calories carried by top 3 elves", %{input: input} do
      assert 212_117 = Day1.part2(input)
    end
  end

  describe "Day 2" do
    setup do
      {:ok, %{input: Fixture.read("2022_day2.txt")}}
    end

    test "find total score if playing perfectly by strategy guide", %{input: input} do
      [_player1, player2] = Day2.part1(input)
      assert 13809 = player2
    end

    test "find total score if playing exactly according to the strategy guide", %{input: input} do
      Day2.part2(input)
      |> IO.inspect()
    end
  end
end
