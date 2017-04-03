defmodule Support.TestCase do

  defmacro __using__(_options \\ []) do
    quote do 
      use ExUnit.Case
      if __ENV__.file
      |> Path.relative_to_cwd()
      |> String.starts_with?("test/acceptance/"), do: @moduletag :acceptance_test
    end
  end
end
