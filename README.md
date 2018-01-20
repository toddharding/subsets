# Subsets

Elixir library for generating subsets/sublists from a list

## Usage

```elixir
iex(1)> Subsets.generate([:a, :b, :c])
[[:a], [:a, :b, :c], [:a, :c], [:a, :b], [:b, :c], [:c], [:b]]

```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `subsets` to your list of dependencies in `mix.exs`:


```elixir
def deps do
  [
    {:subsets, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/subsets](https://hexdocs.pm/subsets).

