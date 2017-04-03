defmodule Privacy.EarmarkPrivacyTest do
  use Support.TestCase
  # TODO: Nullify myself, c.f. local README.md for motivation of
  #       this temporary test
  [
    {Earmark, :_as_html, 2},

    {Earmark.Scanner, :scan_line_into_tokens, 3},
    {Earmark.Scanner, :scan_next_token, 2},
    {Earmark.Scanner, :scan_token_not_at_beg, 1},
    {Earmark.Scanner, :make_ruler_from, 1},
    {Earmark.Scanner, :make_list_item, 1},
    {Earmark.Scanner, :prefixed_with_ws, 2},

    
    {Earmark.Parser, :footnote_def?, 1},
    {Earmark.Parser, :find_footnote_links, 1},
    {Earmark.Parser, :extract_footnote_links, 1},
    {Earmark.Parser, :create_footnote_blocks, 2},

    {Earmark.Message, :emit_message, 3},
    {Earmark.Message, :format_message, 2},

    {Earmark.Line, :lines_with_count, 3},
    {Earmark.Line, :_type_of, 3},
    {Earmark.Line, :block_tag?, 1},
    {Earmark.Line, :split_table_columns, 1},

    {Earmark.Inline, :all_converters, 0},
    {Earmark.Inline, :_convert, 2},
    {Earmark.Inline, :convert_autolink, 2},
    {Earmark.Inline, :convert_each, 2},
    {Earmark.Inline, :converter_for_autolink, 2},
    {Earmark.Inline, :converter_for_br, 2},
    {Earmark.Inline, :converter_for_code, 2},
    {Earmark.Inline, :converter_for_em, 2},
    {Earmark.Inline, :converter_for_escape, 2},
    {Earmark.Inline, :converter_for_footnote, 2},
    {Earmark.Inline, :converter_for_img, 2},
    {Earmark.Inline, :converter_for_inline_ial, 2},
    {Earmark.Inline, :converter_for_link, 2},
    {Earmark.Inline, :converter_for_nolink, 2},
    {Earmark.Inline, :converter_for_reflink, 2},
    {Earmark.Inline, :converter_for_strikethrough_gfm, 2},
    {Earmark.Inline, :converter_for_strong, 2},
    {Earmark.Inline, :converter_for_tag, 2},
    {Earmark.Inline, :converter_for_text, 2},
    {Earmark.Inline, :footnote_link, 3},
    {Earmark.Inline, :is_image?, 1},
    {Earmark.Inline, :output_footnote_link, 4},
    {Earmark.Inline, :output_image, 4},
    {Earmark.Inline, :output_image_or_link, 6},
    {Earmark.Inline, :output_link, 5},
    {Earmark.Inline, :reference_link, 5},
    {Earmark.Inline, :update_lnb, 1},
    {Earmark.Inline, :walk_converters, 3},

    {Earmark.HtmlRenderer, :render_block, 2},
    {Earmark.HtmlRenderer, :add_table_rows, 5},
    {Earmark.HtmlRenderer, :add_tds, 5},
    {Earmark.HtmlRenderer, :add_td_fn, 5},
    {Earmark.HtmlRenderer, :code_classes, 2},
    {Earmark.HtmlRenderer, :emit_messages, 2},

    {Earmark.Helpers, :expander, 2},
    {Earmark.Helpers, :_escape, 1},
    {Earmark.Helpers, :pad, 1},

    {Earmark.Context, :basic_rules, 0},
    {Earmark.Context, :rules_for, 1},
    {Earmark.Context, :smartypants, 1},

  ] |> Enum.each(fn {mod, fun, arity} ->

    test "#{mod}.#{fun}/#{arity} is priavte" do 
      m = unquote(mod)
      f = unquote(fun)
      a = unquote(arity)
      local_module_name = m |> to_string() |> String.replace(~r{\AElixir\.}, "") 
      escaped_fn_name   = f |> to_string() |> String.replace(~r{\?\z}, "\\?")
      assert_raise(UndefinedFunctionError, ~r{\Afunction #{local_module_name}.#{escaped_fn_name}/#{a} is undefined or private}, fn ->
        apply(m, f, List.duplicate(nil, a))
      end)
    end
  end)
  
end
