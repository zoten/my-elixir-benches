Mix.install([
  {:benchee, "~> 1.0"},
  {:benchee_html, "~> 1.0"},
  {:benchee_json, "~> 1.0"}
])

# inspired by https://blog.brian-underwood.codes/elixir/2021/07/23/How-Far-Can-I-Push-a-GenServer?utm_medium=email&utm_source=elixir-radar#benchmark.exs

defmodule Tester do
  def update!(map, key) do
    try do
      {:ok, Map.update!(map, key, fn v -> v end)}
    rescue
      _e in KeyError -> {:error, :no_key}
    end
  end

  def update(map, key) do
    {:ok, Map.update(map, key, %{a: 1}, fn v -> v end)}
  end

  def check_and_update!(map, key) do
    if Map.has_key?(map, key) do
      {:ok, Map.update!(map, key, fn v -> v end)}
    else
      {:error, :no_key}
    end
  end
end

defmodule Helper do
  def random_string(num, alphabet \\ '0123456789abcdefghijklmnopqrstuvwxyz') do
    for _ <- 0..num - 1, into: "", do: <<Enum.random(alphabet)>>
  end

  def create_big_map(num) do
    0..num - 1
    |> Enum.map(fn _ ->
      {Enum.random(10..15) |> random_string() |> String.to_atom(), random_string(100)}
    end)
    |> Enum.into(%{})
  end
end

map_1 = %{blah: 1}
inputs_1_exists = [:blah]
inputs_1_not_exist = [:blargh]

map_500 = Helper.create_big_map(500)
inputs_500_exists = Enum.map(0..500, fn _ -> Enum.random(Map.keys(map_500)) end)
inputs_500_not_exist = for _ <- 0..500, do: Helper.random_string(Enum.random(5..9)) |> String.to_atom()
map_10000 = Helper.create_big_map(10000)
inputs_10000_exists = Enum.map(0..10000, fn _ -> Enum.random(Map.keys(map_10000)) end)
inputs_10000_not_exist = for _ <- 0..10000, do: Helper.random_string(Enum.random(5..9)) |> String.to_atom()


Benchee.run(%{
  "check_and_update!" => fn %{map: map, keys: keys} -> Enum.map(keys, fn key -> Tester.check_and_update!(map, key) end) end,
  "update!" => fn %{map: map, keys: keys} -> Enum.map(keys, fn key -> Tester.update!(map, key) end) end,
  "update" => fn %{map: map, keys: keys} -> Enum.map(keys, fn key -> Tester.update(map, key) end) end,
},
inputs: %{
  "1.key_exists" => %{map: map_1, keys: inputs_1_exists},
  "1.key_not_exist" => %{map: map_1, keys: inputs_1_not_exist},
  "500.key_exists" => %{map: map_500, keys: inputs_500_exists},
  "500.key_not_exist" => %{map: map_500, keys: inputs_500_not_exist},
  "10000.key_exists" => %{map: map_10000, keys: inputs_10000_exists},
  "10000.key_not_exist" => %{map: map_10000, keys: inputs_10000_not_exist},
},
formatters: [
  {Benchee.Formatters.HTML, file: "output/map_update/results.html"},
  Benchee.Formatters.Console
])
