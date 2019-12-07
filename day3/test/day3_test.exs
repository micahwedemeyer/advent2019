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

  test "walk directions" do
    assert Day3.walk_directions([{:U, 2}, {:R,2}]) == [{2, 2}, {1, 2}, {0, 2}, {0, 1}]
  end

  test "find intersections" do
    path1 = [{0,0}, {0,1}, {0,2}]
    path2 = [{1,1}, {1,0}, {0,0}, {0,1}]

    assert Day3.find_intersections(path1, path2) == [{0,0}, {0,1}]
  end

  test "manhattan distance" do
    assert Day3.manhattan_distance({0,0}) == 0
    assert Day3.manhattan_distance({3,0}) == 3
    assert Day3.manhattan_distance({6,6}) == 12
    assert Day3.manhattan_distance({-1, -1}) == 2
  end

  test "best_intersection" do
    p1 = Day3.parse_input("R75,D30,R83,U83,L12,D49,R71,U7,L72")
    p2 = Day3.parse_input("U62,R66,U55,R34,D71,R55,D58,R83")
    assert Day3.manhattan_distance(Day3.best_intersection(p1, p2)) == 159

    p1 = Day3.parse_input("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51")
    p2 = Day3.parse_input("U98,R91,D20,R16,D67,R40,U7,R15,U6,R7")
    assert Day3.manhattan_distance(Day3.best_intersection(p1, p2)) == 135
  end
end
