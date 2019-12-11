defmodule Day2 do
  @moduledoc """
  Documentation for Day2.
  """

  def input do
    [
      1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19,1,9,19,23,2,23,13,27,1,27,9,31,2,31,6,35,1,5,35,39,1,10,39,43,2,43,6,47,1,10,47,51,2,6,51,55,1,5,55,59,1,59,9,63,1,13,63,67,2,6,67,71,1,5,71,75,2,6,75,79,2,79,6,83,1,13,83,87,1,9,87,91,1,9,91,95,1,5,95,99,1,5,99,103,2,13,103,107,1,6,107,111,1,9,111,115,2,6,115,119,1,13,119,123,1,123,6,127,1,127,5,131,2,10,131,135,2,135,10,139,1,13,139,143,1,10,143,147,1,2,147,151,1,6,151,0,99,2,14,0,0
    ]
  end

  def run() do
    part2()
  end

  def part1 do
    input()
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> process
    |> Enum.join(",")
    |> IO.puts
  end

  def part2 do
    {noun, verb} = nouns_and_verbs()
    |> Enum.find(&(test_noun_verb(&1, input())))

    IO.puts(100 * noun + verb)
  end

  def nouns_and_verbs() do
    nouns = 0..99
    verbs = 0..99
    Enum.flat_map(nouns, fn n -> Enum.map(verbs, fn v -> {n, v} end) end)
  end


  def test_noun_verb({noun, verb}, input) do
    result = input
    |> List.replace_at(1, noun)
    |> List.replace_at(2, verb)
    |> process
    |> Enum.at(0)

    result == 19690720
  end

  def process(input) when is_list(input), do: process({:ok, input}, 0)
  def process({:ok, input}, position) do
    op = Enum.at(input, position)
    res = IntCode.int_code(input, op, position)
    process(res, position + 4)
  end

  def process({:halt, result}, _), do: result
end
