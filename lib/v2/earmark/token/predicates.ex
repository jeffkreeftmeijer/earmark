defmodule V2.Earmark.Token.Predicates do

  def hash_token?({:hash, _, _ }), do: true
  def hash_token?(_), do: false

  def text_token?({:verbatim, _, _}), do: true
  def text_token?(_), do: false

  
end
