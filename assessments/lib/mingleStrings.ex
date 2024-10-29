defmodule MingleStrings do
  def mingle_strings(first_string, second_string) do
    first_string = String.to_charlist(first_string)
    second_string = String.to_charlist(second_string)

    ""
    |> mix_strings(first_string, second_string)
  end

  defp mix_strings(final_string, [first_head | first_tail], [second_head | second_tail]) do
    (final_string <> <<first_head>> <> <<second_head>>) |> mix_strings(first_tail, second_tail)
  end

  defp mix_strings(final_value, [], []), do: final_value
  defp mix_strings(final_value, first_list, []), do: final_value <> (first_list |> to_string())
  defp mix_strings(final_value, [], second_list), do: final_value <> (second_list |> to_string())
end
