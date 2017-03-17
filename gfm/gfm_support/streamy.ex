defmodule GfmSupport.Streamy do
  @type funny :: function() | Regex.t
  @spec split_while( Stream.t, funny ) :: {:cont|:halt, list(), Stream.t}
  def split_while(stream, funny, include_trigger \\ false)

  def split_while(stream, fun, include_trigger) when is_function(fun) do
    _split_while(stream, fun, [], include_trigger)
  end
  def split_while(stream, trigger, include_trigger) do
    with fun <- matcher(trigger), do: split_while(stream, fun, include_trigger)
  end

  defp _split_while(stream, fun, result, include_trigger) do
    case head_tail(stream) do
      {:error, _, _} -> {:finished, Enum.reverse(result), stream}
      {:ok, head, tail} ->
        if fun.(head) do
          _split_while(tail, fun, [head | result], include_trigger)
        else
          if include_trigger do
            {:continue, Enum.reverse([head|result]), Stream.drop(stream, 1)}
          else
            {:continue, Enum.reverse(result), stream}
          end
        end
    end
  end

  defp head_tail(stream) do 
    case {Enum.take(stream, 1), Stream.drop(stream, 1)} do
      {[], tail}  -> {:error, nil, tail}
      {[h], tail} -> {:ok, h, tail}
    end
  end

  defp matcher(trigger) when is_binary(trigger) do
   fn line -> line == trigger end
  end
  defp matcher(trigger) do
    if Regex.regex?(trigger) do
       fn line -> Regex.match?(trigger, line) end
    else
      raise ArgumentError, "#{inspect trigger} must be a binary or Regex"
    end
  end

end
