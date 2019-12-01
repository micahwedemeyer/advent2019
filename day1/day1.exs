{:ok, input} = File.read("input.txt")
input = String.split(input)

defmodule Day1 do
  def total_fuel(module_mass) do
    fuel(module_mass) + fuel_fuel(fuel(module_mass))
  end

  def fuel(mass) do
    div(mass, 3) - 2
  end

  def fuel_fuel(mass) do
    fuel_mass = fuel(mass)
    if fuel_mass > 0 do
      fuel_mass + fuel_fuel(fuel_mass)
    else
      0
    end
  end
end

input
|> Enum.map(&String.to_integer/1)
|> Enum.map(&Day1.total_fuel/1)
|> Enum.sum
|> IO.puts
