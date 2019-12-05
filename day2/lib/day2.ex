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
    input1202 =
      input()
      |> List.replace_at(1, 12)
      |> List.replace_at(2, 2)
    result = process(input1202)
    IO.puts(Enum.join(result, ","))
  end

  def process(input) when is_list(input), do: process({:ok, input}, 0)
  def process({:ok, input}, position) do
    op = Enum.at(input, position)
    res = int_code(input, op, position)
    process(res, position + 4)
  end

  def process({:halt, result}, _), do: result

  def int_code(input, 1, position) do
    [op1, op2, res] = int_code_params(input, position)
    val = Enum.at(input, op1) + Enum.at(input, op2)
    {:ok, List.replace_at(input, res, val)}
  end

  def int_code(input, 2, position) do
    [op1, op2, res] = int_code_params(input, position)
    val = Enum.at(input, op1) * Enum.at(input, op2)
    {:ok, List.replace_at(input, res, val)}
  end

  def int_code(input, 99, _position) do
    {:halt, input}
  end

  def int_code_params(input, position) do
    [
      Enum.at(input, position + 1),
      Enum.at(input, position + 2),
      Enum.at(input, position + 3)
    ]
  end
end
