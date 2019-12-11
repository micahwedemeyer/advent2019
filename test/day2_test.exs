defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "handles the full input 1" do
    input = [1,0,0,0,99]
    result = Day2.process(input)
    assert result == [2,0,0,0,99]
  end

  test "handles the full input 2" do
    input = [2,3,0,3,99]
    result = Day2.process(input)
    assert result == [2,3,0,6,99]
  end

  test "handles the full input 3" do
    input = [1,1,1,4,99,5,6,0,99]
    result = Day2.process(input)
    assert result == [30,1,1,4,2,5,6,0,99]
  end

end
