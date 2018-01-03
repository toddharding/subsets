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

  def generate(list) do
    table = :ets.new(:subsets, [])
    :ets.insert(table, {:subsets, []})
    generate(list, [], table)
    [{_, results}]= :ets.lookup(table, :subsets)
    results
    |> Enum.uniq()
    |> Enum.map(fn x -> Enum.reverse(x) end)
  end

  def generate([], [], _) do
    nil
  end

  def generate([], element, table) do
    [{_, results}]  = :ets.lookup(table, :subsets)
    :ets.insert(table, {:subsets, [element | results]})
  end

  def generate([h | t], element, table) do
    new_element = [h | element]
    [{_, results}]= :ets.lookup(table, :subsets)
    case new_element do
      [] -> nil
      _ -> :ets.insert(table, {:subsets, [new_element | results]})
    end
    generate(t, element, table) #|> IO.inspect
    generate(t, new_element, table) #|> IO.inspect
  end

  # Via Map Tree

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

  def generate_via_map_tree(list) do
    generate_via_map_tree(list, [])
    |> traverse_tree([])
    |> Enum.uniq()
    |> Enum.map(fn x -> Enum.reverse(x) end)
  end

  def generate_via_map_tree([], element)do
    element
  end

  def generate_via_map_tree([h | []], element) do
    [h | element]
  end

  def generate_via_map_tree([h | t], element) do
    new_element = [h | element]
    left = generate_via_map_tree(t, element)
    right = generate_via_map_tree(t, new_element)
    %{left: left, right: right, new_element: new_element}
  end

  def number_of_sets(list) when is_list(list) do
    (:math.pow(2, length(list)) |> round) - 1
  end
end
