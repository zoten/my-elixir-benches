Mix.install([
  {:benchee, "~> 1.0"},
  {:benchee_html, "~> 1.0"},
  {:benchee_json, "~> 1.0"}
])

# https://blog.brian-underwood.codes/elixir/2021/07/23/How-Far-Can-I-Push-a-GenServer?utm_medium=email&utm_source=elixir-radar#benchmark.exs

defmodule Tester do
  def update!(map) do
    try do
      {:ok, Map.update!(map, :blah, fn v -> v end)}
    rescue
      e in KeyError -> {:error, :no_key}
    end
  end

  def update(map) do
    {:ok, Map.update(map, :blah, %{a: 1}, fn v -> v end)}
  end

  def check_and_update!(map) do
    if Map.has_key?(map, :blah) do
      {:ok, Map.update!(map, :blah, fn v -> v end)}
    else
      {:error, :no_key}
    end
  end
end

with_key = %{:blah => 1}
without_key = %{}

Benchee.run(%{
  "check_and_update! - key exists" => fn -> Tester.check_and_update!(with_key) end,
  "update! - key exists" => fn -> Tester.update!(with_key) end,
  "update - key exists" => fn -> Tester.update(with_key) end,
  "check_and_update! - key does not exist" => fn -> Tester.check_and_update!(without_key) end,
  "update! - key does not exist" => fn -> Tester.update!(without_key) end,
  "update - key does not exist" => fn -> Tester.update(without_key) end,
})
