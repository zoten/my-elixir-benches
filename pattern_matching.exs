Mix.install([
  {:benchee, "~> 1.0"},
  {:benchee_html, "~> 1.0"},
  {:benchee_json, "~> 1.0"}
])

defmodule Tester do
  def patterned("0" = pattern), do: pattern <> "patterned"
  def patterned("1" = pattern), do: pattern <> "patterned"
  def patterned("2" = pattern), do: pattern <> "patterned"
  def patterned("3" = pattern), do: pattern <> "patterned"
  def patterned("4" = pattern), do: pattern <> "patterned"
  def patterned("5" = pattern), do: pattern <> "patterned"
  def patterned("6" = pattern), do: pattern <> "patterned"
  def patterned("7" = pattern), do: pattern <> "patterned"
  def patterned("8" = pattern), do: pattern <> "patterned"
  def patterned("9" = pattern), do: pattern <> "patterned"
  def patterned("10" = pattern), do: pattern <> "patterned"
  def patterned("11" = pattern), do: pattern <> "patterned"
  def patterned("12" = pattern), do: pattern <> "patterned"
  def patterned("13" = pattern), do: pattern <> "patterned"
  def patterned("14" = pattern), do: pattern <> "patterned"
  def patterned("15" = pattern), do: pattern <> "patterned"
  def patterned("16" = pattern), do: pattern <> "patterned"
  def patterned("17" = pattern), do: pattern <> "patterned"
  def patterned("18" = pattern), do: pattern <> "patterned"
  def patterned("19" = pattern), do: pattern <> "patterned"
  def patterned("20" = pattern), do: pattern <> "patterned"
  def patterned("21" = pattern), do: pattern <> "patterned"
  def patterned("22" = pattern), do: pattern <> "patterned"
  def patterned("23" = pattern), do: pattern <> "patterned"
  def patterned("24" = pattern), do: pattern <> "patterned"
  def patterned("25" = pattern), do: pattern <> "patterned"
  def patterned("26" = pattern), do: pattern <> "patterned"
  def patterned("27" = pattern), do: pattern <> "patterned"
  def patterned("28" = pattern), do: pattern <> "patterned"
  def patterned("29" = pattern), do: pattern <> "patterned"
  def patterned("30" = pattern), do: pattern <> "patterned"
  def patterned("31" = pattern), do: pattern <> "patterned"
  def patterned("32" = pattern), do: pattern <> "patterned"
  def patterned("33" = pattern), do: pattern <> "patterned"
  def patterned("34" = pattern), do: pattern <> "patterned"
  def patterned("35" = pattern), do: pattern <> "patterned"
  def patterned("36" = pattern), do: pattern <> "patterned"
  def patterned("37" = pattern), do: pattern <> "patterned"
  def patterned("38" = pattern), do: pattern <> "patterned"
  def patterned("39" = pattern), do: pattern <> "patterned"
  def patterned("40" = pattern), do: pattern <> "patterned"
  def patterned("41" = pattern), do: pattern <> "patterned"
  def patterned("42" = pattern), do: pattern <> "patterned"
  def patterned("43" = pattern), do: pattern <> "patterned"
  def patterned("44" = pattern), do: pattern <> "patterned"
  def patterned("45" = pattern), do: pattern <> "patterned"
  def patterned("46" = pattern), do: pattern <> "patterned"
  def patterned("47" = pattern), do: pattern <> "patterned"
  def patterned("48" = pattern), do: pattern <> "patterned"
  def patterned("49" = pattern), do: pattern <> "patterned"
  def patterned("50" = pattern), do: pattern <> "patterned"

  def cased(val) do
    case val do
      "0" -> val <> "patterned"
      "1" -> val <> "patterned"
      "2" -> val <> "patterned"
      "3" -> val <> "patterned"
      "4" -> val <> "patterned"
      "5" -> val <> "patterned"
      "6" -> val <> "patterned"
      "7" -> val <> "patterned"
      "8" -> val <> "patterned"
      "9" -> val <> "patterned"
      "10" -> val <> "patterned"
      "11" -> val <> "patterned"
      "12" -> val <> "patterned"
      "13" -> val <> "patterned"
      "14" -> val <> "patterned"
      "15" -> val <> "patterned"
      "16" -> val <> "patterned"
      "17" -> val <> "patterned"
      "18" -> val <> "patterned"
      "19" -> val <> "patterned"
      "20" -> val <> "patterned"
      "21" -> val <> "patterned"
      "22" -> val <> "patterned"
      "23" -> val <> "patterned"
      "24" -> val <> "patterned"
      "25" -> val <> "patterned"
      "26" -> val <> "patterned"
      "27" -> val <> "patterned"
      "28" -> val <> "patterned"
      "29" -> val <> "patterned"
      "30" -> val <> "patterned"
      "31" -> val <> "patterned"
      "32" -> val <> "patterned"
      "33" -> val <> "patterned"
      "34" -> val <> "patterned"
      "35" -> val <> "patterned"
      "36" -> val <> "patterned"
      "37" -> val <> "patterned"
      "38" -> val <> "patterned"
      "39" -> val <> "patterned"
      "40" -> val <> "patterned"
      "41" -> val <> "patterned"
      "42" -> val <> "patterned"
      "43" -> val <> "patterned"
      "44" -> val <> "patterned"
      "45" -> val <> "patterned"
      "46" -> val <> "patterned"
      "47" -> val <> "patterned"
      "48" -> val <> "patterned"
      "49" -> val <> "patterned"
      "50" -> val <> "patterned"
    end
  end
end

  Benchee.run(%{
    "patterned - first" => fn -> Tester.patterned("0") end,
    "patterned - middle" => fn -> Tester.patterned("25") end,
    "patterned - last" => fn -> Tester.patterned("50") end,
    "cased - first" => fn -> Tester.cased("0") end,
    "cased - middle" => fn -> Tester.cased("25") end,
    "cased - last" => fn -> Tester.cased("50") end
  })
