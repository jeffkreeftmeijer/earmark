defmodule V2.Earmark.Token.Makers do
  
  alias V2.Earmark.Token.Tokens, as: T

  def make_headline(tokens, lnb) do 
    level = 1 + Enum.count(tokens)
    %T.Headline{level: level, lnb: lnb, text: String.duplicate("#", level)}
  end
  
  def make_text(text, lnb) do 
    %T.Text{lnb: lnb, text: text}
  end
end
