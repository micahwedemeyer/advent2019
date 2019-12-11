defmodule IntCodeTest do
  use ExUnit.Case

  test "handles intcode 1" do
    input = [1,9,10,3,2,3,11,0,99,30,40,50]
    result = IntCode.int_code(input, 1, 0)
    expected = [1,9,10,70,2,3,11,0,99,30,40,50]
    assert result == {:ok, expected}
  end

  test "handles intcode 2" do
    input = [2,9,10,3,2,3,11,0,99,30,40,50]
    result = IntCode.int_code(input, 2, 0)
    expected = [2,9,10,1200,2,3,11,0,99,30,40,50]
    assert result == {:ok, expected}
  end

  test "handles intcode 99" do
    input = [99,9,10,3,2,3,11,0,99,30,40,50]
    result = IntCode.int_code(input, 99, 0)
    expected = [99,9,10,3,2,3,11,0,99,30,40,50]
    assert result == {:halt, expected}
  end
end
