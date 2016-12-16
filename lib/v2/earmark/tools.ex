defmodule V2.Earmark.Tools do

  @doc false
  @spec p_flat_map( list(A), (A -> V2.Earmark.Scanner.ts) ) :: V2.Earmark.Scanner.ts
  def p_flat_map(collection, func) do 
   collection
    |> Enum.map(fn item -> Task.async(fn -> func.(item) end) end)
    |> Enum.flat_map(&Task.await/1)
  end

end
