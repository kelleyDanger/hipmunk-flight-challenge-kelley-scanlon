defmodule FlightPhoenixServer.InsertionSort do

  ####### INSERTION SORT #######
  def sort(list) when length(list)<=1, do: list
  def sort(list) do
    do_sort([], list)
  end

  #### Private Functions ####
  defp do_sort(_sorted_list = [], _unsorted_list = [head|tail]) do
    do_sort([head], tail)
  end
  defp do_sort(sorted_list, _unsorted_list = [head|tail]) do
    insert(head, sorted_list) |> do_sort(tail)
  end
  defp do_sort(sorted_list, _unsorted_list = []) do
    sorted_list
  end

  defp insert(elem, _sorted_list = []) do
    [elem]
  end
  defp insert(elem, sorted_list) do
    [min|rest] = sorted_list
    if min >= elem do [elem|[min|rest]] else [min|insert(elem, rest)] end
  end

end #FlightPhoenixServer.Sort

# FlightPhoenixServer.InsertionSort.sort(list)


