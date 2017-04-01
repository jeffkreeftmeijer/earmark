defmodule Privacy.EarmarkPrivacyTest do
  use Support.AcceptanceTestcase

  [
    {Earmark, :_as_html, 2},

    {Earmark.Scanner, :scan_line_into_tokens, 3},
    {Earmark.Scanner, :scan_next_token, 2},
    {Earmark.Scanner, :scan_token_not_at_beg, 1},
    {Earmark.Scanner, :make_ruler_from, 1},
    {Earmark.Scanner, :make_list_item, 1},
    {Earmark.Scanner, :prefixed_with_ws, 2},

    {Earmark.Parser, :find_footnote_links, 1},
    {Earmark.Parser, :extract_footnote_links, 1},
    {Earmark.Parser, :create_footnote_blocks, 2},

  ] |> Enum.each(fn {mod, fun, arity} ->

    test "#{mod}.#{fun}/#{arity} is priavte" do 
      m = unquote(mod)
      f = unquote(fun)
      a = unquote(arity)
      local_module_name = m |> to_string() |> String.replace(~r{\AElixir\.}, "")
      assert_raise(UndefinedFunctionError, ~r{\Afunction #{local_module_name}.#{f}/#{a}.*}, fn ->
        apply(m, f, List.duplicate(nil, a))
      end)
    end
  end)
  
end
