defmodule BracketEquality do
  def check_bracket_equality(inputString) do
    inputString = to_charlist(inputString)
    if rem(length(inputString), 2) === 0 do
      "True"
    else
      "False"
    end
  end
end
