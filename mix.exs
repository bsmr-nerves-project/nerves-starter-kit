defmodule NervesStarterKit.Mixfile do

  use Mix.Project

  def project do
    [ app: :nerves_starter_kit,
      version: "0.0.1",
      elixir: "~> 0.12.4",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ mod: { NervesStarterKit, [] } ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:lager, github: "basho/lager", tag: "2.0.3", override: true},
      {:exlager, github: "khia/exlager"},
      {:l2elog, github: "fhunleth/l2elog"},
      {:elixir_ale, github: "fhunleth/elixir_ale"},
      ]
  end

end

