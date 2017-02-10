defmodule FlightPhoenixServer.BubbleSort do

  def sort(list) when is_list(list) do
    make_pass(do_sort(list, []), list)
  end

  defp make_pass(bubbled_list, old_list) when bubbled_list != old_list do
    do_sort(bubbled_list, []) |> make_pass(bubbled_list)
  end
  defp make_pass(bubbled_list, old_list) when bubbled_list == old_list do
    bubbled_list
  end

  defp do_sort(_list = [], _acc) do
    []
  end
  defp do_sort([first|[]], acc) do
    acc ++ [first]
  end
  defp do_sort([first|[second|tail]], acc) do
    [new_first, new_second] = swap(first, second)
    do_sort([new_second|tail], acc ++ [new_first])
  end

  defp swap(e1, e2) do
    if e1 <= e2 do [e1, e2] else [e2, e1] end
  end
end
# FlightPhoenixServer.BubbleSort.sort(list)
