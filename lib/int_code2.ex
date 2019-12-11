defmodule IntCode2 do
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
