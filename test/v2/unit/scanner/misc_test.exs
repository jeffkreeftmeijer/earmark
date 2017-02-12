
defmodule V2.Unit.Scanner.MiscTest do
  use ExUnit.Case

  import Support.Scanner
  
  @moduletag :v2

  describe "scan one line" do
    test "empty" do
      assert scan([""]) == [{:nl, 0, nil}] 
      assert scan("") == [{:nl, 0, nil}] 
    end 
    test "words" do
      assert scan("alpha") == [{:nl, 0, nil}, {:verbatim, 1, 'alpha'}]
      assert scan([ "alpha" ]) == [{:nl, 0, nil}, {:verbatim, 1, 'alpha'}]
    end
  end

  describe "more lines" do
    test "empties" do
      assert scan(["", ""]) == [{:nl, 0, nil}, {:nl, 1, nil}]
    end
    test "words" do
      assert scan(["alpha", "beta"]) == [{:nl, 0, nil}, {:verbatim, 1, 'alpha'}, {:nl, 1, nil}, {:verbatim, 2, 'beta'}]
    end
  end

  describe "mixed tokens" do
    test "words and backtix" do
      assert scan(["hello``world  ", "` "]) == [
       {:nl, 0, nil},
       {:verbatim, 1, 'hello'}, {:backtix, 1, '``'}, {:verbatim, 1, 'world'}, {:ws, 1, '  '}, {:nl, 1, nil},
       {:backtix, 2, '`'}, {:ws, 2, ' '}
     ]
    end
    test "indents" do
      assert scan("    hello") == [{:nl, 0, nil}, {:ws, 1, '    '}, {:verbatim, 1, 'hello'}]
    end
  end

end
