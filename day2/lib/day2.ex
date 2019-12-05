defmodule Day2 do
  @moduledoc """
  Documentation for Day2.
  """

  def process(input) do
    proc({:ok, input})
  end

  def proc({:ok, vals}), do: proc(int_code(vals))
  def proc({:halt, vals}), do: vals


  def int_code(input) when hd(input) == 1 do
    [op1, op2, res] = int_code_params(input)
    val = Enum.at(input, op1) + Enum.at(input, op2)
    {:ok, List.replace_at(input, res, val)}
  end

  def int_code(input) when hd(input) == 2 do
    [op1, op2, res] = int_code_params(input)
    val = Enum.at(input, op1) * Enum.at(input, op2)
    {:ok, List.replace_at(input, res, val)}
  end

  def int_code(input) when hd(input) == 99 do
    {:halt, input}
  end

  def int_code_params(rest) do
    [
      Enum.at(rest, 1),
      Enum.at(rest, 2),
      Enum.at(rest, 3)
    ]
  end
end
