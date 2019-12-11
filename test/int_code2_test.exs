defmodule IntCode2Test do
  use ExUnit.Case

  test "parses instruction sets" do
    assert IntCode2.parse_instruction(1002) == [2, :p, :i, :p]
    assert IntCode2.parse_instruction(1) == [1, :p, :p, :p]
    assert IntCode2.parse_instruction(99) == [99]
  end

  test "interprets parameters" do
    assert IntCode2.find_params([1,2,3,4,5,6,7], 2, {2, :p, :i, :p}) == {2, {:p, 4}, {:i, 5}, {:p, 6}}
  end

  test "digit_count" do
    assert IntCode2.digit_count(1000) == 4
    assert IntCode2.digit_count(9999) == 4
    assert IntCode2.digit_count(10000) == 5
    assert IntCode2.digit_count(99999) == 5
    assert IntCode2.digit_count(1) == 1
    assert IntCode2.digit_count(0) == 1
    assert IntCode2.digit_count(-1) == 1
    assert IntCode2.digit_count(-10000) == 5
  end

  test "digit" do
    assert IntCode2.digit(123, 0) == 3
    assert IntCode2.digit(123, 1) == 2
    assert IntCode2.digit(123, 2) == 1

    # For leading zeros
    assert IntCode2.digit(1, 1) == 0
    assert IntCode2.digit(1, 2) == 0
    assert IntCode2.digit(111, 3) == 0
  end
end
