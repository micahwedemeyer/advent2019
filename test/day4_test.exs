defmodule Day4Test do
  use ExUnit.Case

  test "digit" do
    assert Day4.digit(111111, 0) == 1
    assert Day4.digit(123456, 1) == 2
    assert Day4.digit(765432, 2) == 5
    assert Day4.digit(909090, 3) == 0
  end

  test "is_increasing" do
    assert Day4.is_increasing(111111)
    assert Day4.is_increasing(111112)
    assert Day4.is_increasing(012349)
    assert Day4.is_increasing(001139)

    assert !Day4.is_increasing(111110)
    assert !Day4.is_increasing(123321)
    assert !Day4.is_increasing(101234)
    assert !Day4.is_increasing(123234)
  end

  test "has_repeat" do
    assert Day4.has_repeat(111111)
    assert Day4.has_repeat(123321)
    assert Day4.has_repeat(123455)
    assert Day4.has_repeat(987664)

    assert !Day4.has_repeat(123456)
    assert !Day4.has_repeat(987654)
    assert !Day4.has_repeat(121212)
    assert !Day4.has_repeat(123123)
  end

  test "has_double" do
    assert Day4.has_double(112233)
    assert Day4.has_double(111122)

    assert !Day4.has_double(123444)
  end
end
