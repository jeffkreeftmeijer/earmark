defmodule Support.Tokenizer do
  
  def tokenize(lines) do
    V2.Earmark.Scanner.scan_lines(lines) |>
    V2.Earmark.Token.tokenize()
  end
end
