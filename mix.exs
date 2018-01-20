defmodule Subsets.Mixfile do
  use Mix.Project

  def project do
    [
      app: :subsets,
      version: "0.1.1",
      description: description(),
      package: package(),
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description() do
    "Subset/Sublist generator"
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "LICENSE"],
      maintainers: ["Todd Harding"],
      licenses: ["BSD 3-Clause"],
      links: %{"GitHub" => "https://github.com/toddharding/subsets"}
    ]
  end
end
