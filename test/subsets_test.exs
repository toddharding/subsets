defmodule SubsetsTest do
  use ExUnit.Case
  doctest Subsets

  test "number of subsets in [1, 2, 3]" do
    assert Subsets.number_of_sets([1, 2, 3]) == 7
  end

  test "subsets of []" do
    assert Subsets.generate([]) == []
  end

  test "subsets of [1]" do
    assert Subsets.generate([1]) == [[1]]
  end

  test "subsets of [1, 2]" do
    set = MapSet.new([1, 2])

    subset = set
    |> MapSet.to_list()
    |> Subsets.generate
    |> MapSet.new

    wanted_subset = MapSet.new([[1], [2], [1, 2]])
    assert MapSet.equal?(subset, wanted_subset)
  end

  test "subsets of [1, 2, 3]" do
    set = MapSet.new([1, 2, 3])

    subset = set
    |> MapSet.to_list()
    |> Subsets.generate
    |> MapSet.new

    wanted_subset = MapSet.new([[1, 2], [1, 3], [2, 3], [1], [2], [3], [1, 2, 3]])
    assert MapSet.equal?(subset, wanted_subset)
  end

  test "subsets of [1, 2, 3, 4]" do
      set = MapSet.new([1, 2, 3, 4])

      subset = set
      |> MapSet.to_list()
      |> Subsets.generate
      |> MapSet.new

      # if length of set > 1 then generate subsets
      wanted_subset = MapSet.new([
        [1], [2], [3], [4], [1, 2, 3, 4],
        [1, 2, 3], [1, 2, 4], [2, 3, 4], [1, 3, 4],
        [1, 2], [1, 3], [2, 3],
        [1, 4], [2, 4],
        [2, 3], [2, 4], [3, 4]
       ])
      assert MapSet.equal?(subset, wanted_subset)
    end
end
