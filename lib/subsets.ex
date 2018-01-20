defmodule Subsets do
  @moduledoc """
  Documentation for Subsets.
  """

  @doc """
  Generates Subsets from a list.

  [1, 2, 3] = [[1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]

  """
  def generate([]) do
    []
  end

  def generate([h | []]) do
    [[h]]
  end

  def generate(list) do
    generate(list, [])
    |> traverse_tree([])
    |> Enum.uniq()
    |> Enum.map(fn x -> Enum.reverse(x) end)
  end

  def generate([], element)do
    element
  end

  def generate([h | []], element) do
    [h | element]
  end

  def generate([h | t], element) do
    new_element = [h | element]
    left = generate(t, element)
    right = generate(t, new_element)
    %{left: left, right: right, new_element: new_element}
  end

  def traverse_tree(%{left: left = %{}, right: right = %{}, new_element: new_element}, acc) do
    acc = traverse_tree(left, acc)
    acc = traverse_tree(right, acc)
    [new_element | acc]
  end

  def traverse_tree(%{left: left, right: right, new_element: new_element}, acc) do
    stage_1 = [new_element | acc ]
    stage_2 = [left | stage_1]
    [right | stage_2]
  end

  def number_of_sets(list) when is_list(list) do
    (:math.pow(2, length(list)) |> round) - 1
  end
end
