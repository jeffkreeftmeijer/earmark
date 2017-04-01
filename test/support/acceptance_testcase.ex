defmodule Support.AcceptanceTestcase do

  defmacro __using__(_options \\ []) do
    quote do 
      use ExUnit.Case
      @moduletag :acceptance
    end
  end
  
end
