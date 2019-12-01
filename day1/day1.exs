{:ok, input} = File.read("input.txt")
input = String.split(input)

defmodule Day1 do
  def fuel(mass) do
    div(mass, 3) - 2
  end
end

input
|> Enum.map(&String.to_integer/1)
|> Enum.map(&Day1.fuel/1)
|> Enum.sum
|> IO.puts
