defmodule Day4 do

  def input do
    168630..718098
  end

  def part1 do
    input()
    |> Enum.filter(&is_valid/1)
    |> Enum.count
    |> IO.puts
  end

  def part2 do
    input()
    |> Enum.filter(&is_valid2/1)
    |> Enum.count
    |> IO.puts
  end

  def is_valid(val) do
    is_increasing(val) && has_repeat(val)
  end

  def is_valid2(val) do
    is_increasing(val) && has_double(val)
  end

  def is_increasing(val) do
    0..4
    |> Enum.all?(&(digit(val, &1) <= digit(val, &1 + 1)))
  end

  def has_repeat(val) do
    0..4
    |> Enum.any?(&(digit(val, &1) == digit(val, &1 + 1)))
  end

  def has_double(val) do
    best_series = 0..5
    |> Enum.map(&(digit(val, &1)))
    |> Enum.reduce_while(:start, &is_same/2)

    elem(best_series, 1) == 2
  end

  defp is_same(x, :start), do: {:cont, {x, 1}}
  defp is_same(x, {x, count}), do: {:cont, {x, count + 1}}
  defp is_same(x, {_y, 2}), do: {:halt, {x, 2}}
  defp is_same(x, {_y, _count}), do: {:cont, {x, 1}}

  def digit(val, index) do
    div(rem(val * pow(10, index), pow(10, 6)), pow(10, 5))
  end

  def  pow(n, k), do: pow(n, k, 1)
  defp pow(_, 0, acc), do: acc
  defp pow(n, k, acc), do: pow(n, k - 1, n * acc)
end
