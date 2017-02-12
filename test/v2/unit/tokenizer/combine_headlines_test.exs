defmodule V2.Unit.Tokenizer.CombineHeadlinesTest do
  use ExUnit.Case

  import Support.Tokenizer
  alias V2.Earmark.Token.Tokens, as: T

  describe "Hashes" do
    test "at beginning of line" do
      assert tokenize("##") == [%T.Headline{lnb: 1, text: "##", level: 2}]
    end
    test "not at beginning of line" do
      assert tokenize(" ##") == [%T.Indent{lnb: 1, text: " ", length: 1}, %T.Text{lnb: 1, text: "##"}]
    end
  end
  
end
