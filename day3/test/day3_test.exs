defmodule Day3Test do
  use ExUnit.Case

  test "input parsing" do
    assert Day3.parse_input("R3,U4,L4") == [{:R, 3}, {:U, 4}, {:L, 4}]
  end

  test "step" do
    assert Day3.step({5,5}, :U) == {5, 6}
    assert Day3.step({2,1}, :R) == {3, 1}
    assert Day3.step({0,0}, :D) == {0, -1}
    assert Day3.step({3,4}, :L) == {2, 4}

    assert Day3.step([{1,2}, {1,1}], :U) == [{1,3}, {1,2}, {1,1}]
  end

  test "coord_list" do
    assert Day3.coord_list({0, 0}, :U, 2) == [{0,2}, {0,1}]
    assert Day3.coord_list({2, 2}, :R, 2) == [{4,2}, {3,2}]
    assert Day3.coord_list({-1, 0}, :D, 2) == [{-1,-2}, {-1,-1}]
    assert Day3.coord_list({3, 0}, :L, 2) == [{1,0}, {2,0}]
  end
end
