defmodule MingleStrings do
  def mingle_strings(first_string, second_string) do
    first_string = String.to_charlist(String.trim(first_string))
    second_string = String.to_charlist(String.trim(second_string))

    ""
    |> mix_strings(first_string, second_string)
  end

  defp mix_strings(final_string, [first_head | first_tail], [second_head | second_tail]) do
    (final_string <> <<first_head>> <> <<second_head>>) |> mix_strings(first_tail, second_tail)
  end

  defp mix_strings(final_value, [], []), do: final_value
  defp mix_strings(final_value, first_list, []), do: final_value <> (first_list |> to_string()) #explanation below
  defp mix_strings(final_value, [], second_list), do: final_value <> (second_list |> to_string())

  # defp mix_strings(final_value, first_list, []), do: [final_value | first_list]
  # output: ["a1b2c3d4", 101, 102, 103, 104]
  # this will append the final string in the list but the list we have is using ascii codes,
  # also we need string as the end result not a list
end
