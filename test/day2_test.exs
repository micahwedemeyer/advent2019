defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "handles intcode 1" do
    input = [1,9,10,3,2,3,11,0,99,30,40,50]
    result = Day2.int_code(input, 1, 0)
    expected = [1,9,10,70,2,3,11,0,99,30,40,50]
    assert result == {:ok, expected}
  end

  test "handles intcode 2" do
    input = [2,9,10,3,2,3,11,0,99,30,40,50]
    result = Day2.int_code(input, 2, 0)
    expected = [2,9,10,1200,2,3,11,0,99,30,40,50]
    assert result == {:ok, expected}
  end

  test "handles intcode 99" do
    input = [99,9,10,3,2,3,11,0,99,30,40,50]
    result = Day2.int_code(input, 99, 0)
    expected = [99,9,10,3,2,3,11,0,99,30,40,50]
    assert result == {:halt, expected}
  end

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
