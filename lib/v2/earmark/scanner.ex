defmodule V2.Earmark.Scanner do

  import V2.Earmark.Tools, only: [p_flat_map: 2]
  import Earmark.Helpers.LeexHelpers

  @type t :: {atom(), number(), String.t}
  @type ts :: list(t)
 
  @doc """
    Parallel scan of `lines` into tokens.
  """
  @spec scan_lines([String.t]) :: Scanner.ts
  def scan_lines(lines) 
  def scan_lines(line) when is_binary(line) do
    scan_line({line, 1})
  end
  def scan_lines(lines) when is_list(lines) do
    lines
    |> Enum.zip(1..Enum.count(lines))
    |> p_flat_map(&scan_line/1)
  end

  defp scan_line({line, lnb}) do 
    [
      {:nl, lnb-1, nil} |
     lex(line, with: :v2_lexer)
     |> add_lnbs(lnb)
   ]
  end

  defp add_lnbs(tokens, lnb), do: Enum.map(tokens, &add_lnb(&1, lnb))
  defp add_lnb({tokent, tokenc}, lnb), do: {tokent, lnb, to_string(tokenc)}
end
