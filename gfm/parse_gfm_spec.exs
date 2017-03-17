defmodule ParseGfmSpec do
  
  import Support.Streamy, only: [split_while: 2]

  @usage """
    parse_gfm spec_file test_cases_file
  """
  
  @example_sep ~r{\A``````````}

  def main([spec_file, _test_case_file]) do 
    IO.puts "Parsing Gfm Spec"
    with examples <- spec_file |> File.stream! |> parse_stream(:next, []) do
      examples
        |> Enum.reverse()
        |> Enum.take(7)
        |> IO.inspect
    end
  end
  def main(["--help"]),  do: main([])
  def main(["-h"]),      do: main([])
  def main(_),           do: IO.puts(:stderr,  @usage)

  @example_beg ~r{\A``````````\s*example\s*\z}
  @example_end ~r{\A``````````\s*\z}

  defp parse_stream(stream, :next, result) do 
    with forwarded <- stream |> Stream.drop_while(&not_beg_of_example/1) |> Stream.drop(1), do:
      parse_stream(forwarded, :found, result)
  end
  defp parse_stream(stream, :found, result) do 
    case stream |> split_while(&not_end_of_example/1) do 
      {:finished, example, _} -> IO.puts(:stderr, "Last example not complete")
                                 [make_example(example) | result]
      {:continue, example, rest} ->
        # first line of rest is end marker of example
        parse_stream(Stream.drop(rest, 1), :next, [make_example(example) | result])
    end
  end 


  defp not_beg_of_example(str) do 
    !Regex.matches?(@example_beg, str)
  end
  defp not_end_of_example(str) do 
    !Regex.matches?(@example_end, str)
  end

  defp empty?(stream) do 
    case head(stream) do 
      {:error, _} -> true
      {:ok, h}    -> false
    end
  end
end

ParseGfmSpec.main(System.argv)
