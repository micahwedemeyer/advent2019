defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "handles intcode 1" do
    input = [1,9,10,3,2,3,11,0,99,30,40,50]
    result = Day2.int_code(input)
    expected = [1,9,10,70,2,3,11,0,99,30,40,50]
    assert result == {:ok, expected}
  end

  test "handles intcode 2" do
    input = [2,9,10,3,2,3,11,0,99,30,40,50]
    result = Day2.int_code(input)
    expected = [2,9,10,1200,2,3,11,0,99,30,40,50]
    assert result == {:ok, expected}
  end

  test "handles intcode 99" do
    input = [99,9,10,3,2,3,11,0,99,30,40,50]
    result = Day2.int_code(input)
    expected = [99,9,10,3,2,3,11,0,99,30,40,50]
    assert result == {:halt, expected}
  end
end
