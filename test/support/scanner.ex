defmodule Support.Scanner do
  alias V2.Earmark.Scanner

  def scan(lines), do: Scanner.scan_lines(lines)
  def scan1(lines) do
    case scan(lines) do 
      [{:nl, 0, nil} | rest] -> rest
      _                      -> :error
    end
  end

  def tokens(lines) do 
    scan(lines)
      |> Enum.map(fn {token, _, _} -> token end)
  end

  def tokens1(lines) do 
    scan1(lines)
      |> Enum.map(fn {token, _, _} -> token end)
  end

end
