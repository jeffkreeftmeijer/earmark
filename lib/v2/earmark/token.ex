defmodule V2.Earmark.Token do

  alias V2.Earmark.Token.Tokens, as: T
  import V2.Earmark.Token.Predicates
  import V2.Earmark.Token.Makers


  @spec tokenize(V2.Earmark.Scanner.ts) :: T.ts
  def tokenize(scanned_tokens) do
    scanned_tokens
    |> _tokenize([], 0)
    |> Enum.reverse()
  end

  defp _tokenize(remaining_symbols, tokenized_tokens, current_column)

  defp _tokenize([], result, _), do: result

  defp _tokenize([{:nl, _, _} | rest], result, _), do: _tokenize(rest, result, 0)

  defp _tokenize([{:ws, lnb, text} | rest], result, 0) do
    _tokenize(rest, [make_indent(text, lnb)|result], String.length(text))
  end

  defp _tokenize([{:hash, lnb, _} | rest], result, 0) do
    with {hashes, rest1} <- Enum.split_while(rest, &hash_token?/1) do
      _tokenize(rest1, [make_headline(hashes, lnb)|result], Enum.count(hashes))
    end
  end
  defp _tokenize([fh={:hash, lnb, _} | rest], result, col) do
    with {hashes, rest1} <- Enum.split_while(rest, &hash_or_text?/1) do
      _tokenize(rest1, [make_text([fh|hashes], lnb)|result], Enum.count(hashes)+1+col)
    end
  end

  defp _tokenize([{_, lnb, text} | rest], result, col) do
      _tokenize(rest, [make_text(text, lnb)|result], col + String.length(text))
  end

end
