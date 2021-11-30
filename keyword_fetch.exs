Mix.install([
  {:benchee, "~> 1.0"},
  {:benchee_html, "~> 1.0"},
  {:benchee_json, "~> 1.0"}
])

# https://blog.brian-underwood.codes/elixir/2021/07/23/How-Far-Can-I-Push-a-GenServer?utm_medium=email&utm_source=elixir-radar#benchmark.exs

defmodule Tester do
  def fetch!(kw, key) do
    try do
      {:ok, Keyword.fetch!(kw, key)}
    rescue
      _e in KeyError -> {:error, :no_key}
    end
  end

  def fetch(kw, key) do
    {:ok, Keyword.fetch(kw, key)}
  end

  def check_and_fetch!(kw, key) do
    if Keyword.has_key?(kw, key) do
      {:ok, Keyword.fetch!(kw, key)}
    else
      {:error, :no_key}
    end
  end
end

defmodule Helper do
  def random_string(num, alphabet \\ '0123456789abcdefghijklmnopqrstuvwxyz') do
    for _ <- 0..num - 1, into: "", do: <<Enum.random(alphabet)>>
  end

  def create_big_kwlist(num) do
    0..num - 1
    |> Enum.map(fn _ ->
      {Enum.random(10..15) |> random_string() |> String.to_atom(), random_string(100)}
    end)
    |> Keyword.new()
  end
end

kw_1 = [blah: 1]
inputs_1_exists = [:blah]
inputs_1_not_exist = [:blargh]

kw_500 = Helper.create_big_kwlist(500)
inputs_500_exists = Enum.map(0..500, fn _ -> Enum.random(Keyword.keys(kw_500)) end)
inputs_500_not_exist = for _ <- 0..500, do: Helper.random_string(Enum.random(5..9)) |> String.to_atom()
kw_10000 = Helper.create_big_kwlist(10000)
inputs_10000_exists = Enum.map(0..10000, fn _ -> Enum.random(Keyword.keys(kw_10000)) end)
inputs_10000_not_exist = for _ <- 0..10000, do: Helper.random_string(Enum.random(5..9)) |> String.to_atom()


Benchee.run(%{
  "check_and_fetch!" => fn %{kw: kw, keys: keys} -> Enum.map(keys, fn key -> Tester.check_and_fetch!(kw, key) end) end,
  "fetch!" => fn %{kw: kw, keys: keys} -> Enum.map(keys, fn key -> Tester.fetch!(kw, key) end) end,
  "fetch" => fn %{kw: kw, keys: keys} -> Enum.map(keys, fn key -> Tester.fetch(kw, key) end) end,
},
inputs: %{
  "1.key_exists" => %{kw: kw_1, keys: inputs_1_exists},
  "1.key_not_exist" => %{kw: kw_1, keys: inputs_1_not_exist},
  "500.key_exists" => %{kw: kw_500, keys: inputs_500_exists},
  "500.key_not_exist" => %{kw: kw_500, keys: inputs_500_not_exist},
  "10000.key_exists" => %{kw: kw_10000, keys: inputs_10000_exists},
  "10000.key_not_exist" => %{kw: kw_10000, keys: inputs_10000_not_exist},
},
formatters: [
  {Benchee.Formatters.HTML, file: "output/keyword_fetch/results.html"},
  Benchee.Formatters.Console
])
