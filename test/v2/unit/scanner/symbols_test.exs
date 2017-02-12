defmodule V2.Unit.Scanner.SymbolsTest do
  use ExUnit.Case

  import Support.Scanner
  
  @moduletag :v2

  describe "underscores" do
    test "one" do
      assert scan("_") == [{:nl, 0, nil}, {:underscore, 1, "_"}]
    end
    test "two" do
      assert scan("__") == [{:nl, 0, nil}, {:underscore, 1, "_"}, {:underscore, 1, "_"}]
    end
  end

  describe "underscores and other symbols" do
    test "with star" do
      assert scan1("_ *") == [{:underscore, 1, "_"}, {:ws, 1, " "}, {:star, 1, "*"}] 
    end
    test "texas" do
      assert tokens1("*") == [:star]
    end
  end
  
  describe "a poutpourri" do
    test "some" do
     assert tokens1("*-# ## = ~ [(]){}`'\"") ==
      [:star, :dash, :hash, :ws, :hash, :hash, :ws, :equal, :ws, :tilde, :ws, :lbracket, :lparen, :rbracket, :rparen, :laccolade, :raccolade, :backtix,
       :quote, :dquote]
    end

    test "some more" do
      assert tokens1(["|", "^ hello42"]) ==
      [:bar, :nl, :caret, :ws, :verbatim, :number]
    end

    test "surely not done yet" do
      assert tokens1("::< >&;+.!/@") == [:colon, :colon, :langle, :ws, :rangle, :amp, :semicolon, :plus, :dot, :exclam, :slash, :at]
    end
  end
end
