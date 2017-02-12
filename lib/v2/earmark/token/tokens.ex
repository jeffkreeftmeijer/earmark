defmodule V2.Earmark.Token.Tokens do
  
  defmodule Headline, do: defstruct lnb: 0, text: "", level: 1
  defmodule Text,     do: defstruct lnb: 0, text: ""
  defmodule Indent,   do: defstruct lnb: 0, text: "", length: 1

  @type t :: %Headline{} | %Text{}
  @type ts :: list(t)
end
