defmodule IntCode2 do
  def input do
    [3,225,1,225,6,6,1100,1,238,225,104,0,1001,92,74,224,1001,224,-85,224,4,224,1002,223,8,223,101,1,224,224,1,223,224,223,1101,14,63,225,102,19,83,224,101,-760,224,224,4,224,102,8,223,223,101,2,224,224,1,224,223,223,1101,21,23,224,1001,224,-44,224,4,224,102,8,223,223,101,6,224,224,1,223,224,223,1102,40,16,225,1102,6,15,225,1101,84,11,225,1102,22,25,225,2,35,96,224,1001,224,-350,224,4,224,102,8,223,223,101,6,224,224,1,223,224,223,1101,56,43,225,101,11,192,224,1001,224,-37,224,4,224,102,8,223,223,1001,224,4,224,1,223,224,223,1002,122,61,224,1001,224,-2623,224,4,224,1002,223,8,223,101,7,224,224,1,223,224,223,1,195,87,224,1001,224,-12,224,4,224,1002,223,8,223,101,5,224,224,1,223,224,223,1101,75,26,225,1101,6,20,225,1102,26,60,224,101,-1560,224,224,4,224,102,8,223,223,101,3,224,224,1,223,224,223,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,108,677,226,224,102,2,223,223,1006,224,329,1001,223,1,223,1108,226,677,224,1002,223,2,223,1006,224,344,101,1,223,223,7,226,677,224,102,2,223,223,1006,224,359,1001,223,1,223,1007,226,677,224,1002,223,2,223,1006,224,374,1001,223,1,223,1108,677,226,224,102,2,223,223,1005,224,389,1001,223,1,223,107,226,226,224,102,2,223,223,1006,224,404,101,1,223,223,1107,226,226,224,1002,223,2,223,1005,224,419,1001,223,1,223,1007,677,677,224,102,2,223,223,1006,224,434,101,1,223,223,1107,226,677,224,1002,223,2,223,1006,224,449,101,1,223,223,107,677,677,224,102,2,223,223,1005,224,464,1001,223,1,223,1008,226,226,224,1002,223,2,223,1005,224,479,101,1,223,223,1007,226,226,224,102,2,223,223,1005,224,494,1001,223,1,223,8,677,226,224,1002,223,2,223,1005,224,509,1001,223,1,223,108,677,677,224,1002,223,2,223,1005,224,524,1001,223,1,223,1008,677,677,224,102,2,223,223,1006,224,539,1001,223,1,223,7,677,226,224,1002,223,2,223,1005,224,554,101,1,223,223,1108,226,226,224,1002,223,2,223,1005,224,569,101,1,223,223,107,677,226,224,102,2,223,223,1005,224,584,101,1,223,223,8,226,226,224,1002,223,2,223,1005,224,599,101,1,223,223,108,226,226,224,1002,223,2,223,1006,224,614,1001,223,1,223,7,226,226,224,102,2,223,223,1006,224,629,1001,223,1,223,1107,677,226,224,102,2,223,223,1005,224,644,101,1,223,223,8,226,677,224,102,2,223,223,1006,224,659,1001,223,1,223,1008,226,677,224,1002,223,2,223,1006,224,674,1001,223,1,223,4,223,99,226]
  end

  def part1 do
    run(input()) |> IO.puts
  end

  def parse_instruction(instruction) do
    opcode = digit(instruction, 1) * 10 + digit(instruction, 0)

    # Shift by 2 for the opcode digits
    params = 2..(param_count(opcode) + 2)
    |> Enum.take(param_count(opcode)) # Kinda weird, but required because ranges are inclusive
    |> Enum.map(&(digit(instruction, &1)))
    |> Enum.map(&param_mode/1)
    |> Enum.to_list

    [opcode] ++ params
  end

  def interpolate_params([opcode | params], input, position) do
    param_positions = params
    |> Enum.with_index(position + 1)
    |> Enum.map(&({elem(&1, 0), Enum.at(input, elem(&1, 1))}))

    [opcode] ++ param_positions
  end

  def run(input), do: run({:cont, {input, 0}})
  def run({:cont, {input, position}}), do: run(exec(input, position))
  def run({:halt, {input, _}}), do: input

  def exec(input, position) do
    Enum.at(input, position)
    |> parse_instruction
    |> interpolate_params(input, position)
    |> int_code(input, position)
  end

  def int_code([1, op1, op2, {_, res}], input, position) do
    val = val_at(input, op1) + val_at(input, op2)
    {:cont, {List.replace_at(input, res, val), position + 4}}
  end

  def int_code([2, op1, op2, {_, res}], input, position) do
    val = val_at(input, op1) * val_at(input, op2)
    {:cont, {List.replace_at(input, res, val), position + 4}}
  end

  def int_code(input, 99, _position) do
    {:halt, {input, 0}}
  end

  defp val_at(_input, {:i, x}), do: x
  defp val_at(input, {:p, x}), do: Enum.at(input, x)


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

end
