defmodule V2.Earmark.Token.Makers do

  alias V2.Earmark.Token.Tokens, as: T

  def make_headline(tokens, lnb) do 
  level = 1 + Enum.count(tokens)
  %T.Headline{level: level, lnb: lnb, text: String.duplicate("#", level)}
  end

  def make_indent(text, lnb) do
    %T.Indent{lnb: lnb, text: text, length: String.length(text)}
  end

  def make_text(tokens, lnb) when is_list(tokens) do 
    text1 = tokens
      |> Enum.map(fn {_, _, t} -> t end)
      |> Enum.join("")
    %T.Text{lnb: lnb, text: text1}
  end
  def make_text(text, lnb) do 
  %T.Text{lnb: lnb, text: text}
  end
end
