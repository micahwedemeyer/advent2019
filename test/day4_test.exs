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

  test "has_double" do
    assert Day4.has_double(111111)
    assert Day4.has_double(123321)
    assert Day4.has_double(123455)
    assert Day4.has_double(987664)

    assert !Day4.has_double(123456)
    assert !Day4.has_double(987654)
    assert !Day4.has_double(121212)
    assert !Day4.has_double(123123)
  end
end
