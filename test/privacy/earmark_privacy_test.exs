defmodule Privacy.EarmarkPrivacyTest do
  use Support.AcceptanceTestcase

  [
    {Earmark, :_as_html, 2}
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
