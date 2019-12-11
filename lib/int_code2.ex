defmodule IntCode2 do
  def parse_instruction(instruction) do
    digits = case digit_count(instruction) do
      1 -> 2 # Strange case with single digit opcode and all leading zeros
      x -> x
    end
    opcode = digit(instruction, 1) * 10 + digit(instruction, 0)

    # Shift by 2 for the opcode digits
    params = 2..(param_count(opcode) + 2)
    |> Enum.take(param_count(opcode)) # Kinda weird, but required because ranges are inclusive
    |> Enum.map(&(digit(instruction, &1)))
    |> Enum.map(&param_mode/1)
    |> Enum.to_list

    [opcode] ++ params
  end

  def find_params(input, position, parsed_instruction) do
  end

  def int_code(input, position, 1, {op1, op2, res}) do
    val = Enum.at(input, op1) + Enum.at(input, op2)
    {:ok, List.replace_at(input, res, val)}
  end

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

  # Returns the digit at the power of 10
  # digit(123, 0) == 3
  # digit(123, 1) == 2
  # digit(123, 2) == 1
  def digit(val, pow10) do
    shifted = div(val, pow(10, pow10))
    rem(shifted, 10)
  end

  def  pow(n, k), do: pow(n, k, 1)
  defp pow(_, 0, acc), do: acc
  defp pow(n, k, acc), do: pow(n, k - 1, n * acc)

  def digit_count(0), do: 1
  def digit_count(val) when val < 0, do: digit_count(val * -1)
  def digit_count(val) do
    trunc(Float.ceil(:math.log10(val + 1)))
  end

  def param_mode(0), do: :p
  def param_mode(1), do: :i

  def param_count(1), do: 3
  def param_count(2), do: 3
  def param_count(99), do: 0
  def param_count(_), do: :err

  def val_at(_input, {:i, x}), do: x
  def val_at(input, {:p, x}), do: Enum.at(input, x)
end
