defmodule IntCode2Test do
  use ExUnit.Case

  test "addition" do
    assert IntCode2.int_code([1, {:p, 4}, {:i, 3}, {:p, 4}], [1002,4,3,4,33], 0) == {:cont, {[1002,4,3,4,36], 4}}
  end

  test "multipication" do
    assert IntCode2.int_code([2, {:p, 4}, {:i, 3}, {:p, 4}], [1002,4,3,4,33], 0) == {:cont, {[1002,4,3,4,99], 4}}
  end

  test "parses instruction sets" do
    assert IntCode2.parse_instruction(1002) == [2, :p, :i, :p]
    assert IntCode2.parse_instruction(1) == [1, :p, :p, :p]
    assert IntCode2.parse_instruction(99) == [99]
  end

  test "interpolate_params" do
    assert IntCode2.interpolate_params([2, :p, :i, :p], [1002,4,3,4,33], 0) == [2, {:p, 4}, {:i, 3}, {:p, 4}]
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
