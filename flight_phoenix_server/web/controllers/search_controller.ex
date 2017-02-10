defmodule HipmunkKelley.SearchController do
  use HipmunkKelley.Web, :controller
  require IEx

  def index(conn, _params) do
    providers = ["expedia", "orbitz", "priceline", "travelocity", "united"]
    # Get all 5 responses in json form
    # Ruby-like syntax
    #results = Enum.flat_map(providers, fn(provider) ->
    #  flight_results(provider)
    #end)

    # Elixir piped syntax
   # results =
   #   providers
   #   |> Enum.flat_map(fn(provider) ->
   #     flight_results(provider)
   #   end)
   #   |> Enum.sort_by(&Map.get(&1, "agony"))


    results =
      providers
      |> Enum.map(fn(provider) ->
        Task.async(fn -> flight_results(provider) end)
      end) #mapping
      |> Enum.flat_map(fn(task) -> Task.await(task) end)


   # sort_insert = FlightPhoenixServer.InsertionSort.sort(results)
   # sort_shell  = FlightPhoenixServer.ShellSort.sort(results)
   # sort_bubble  = FlightPhoenixServer.BubbleSort.sort(results)


   # time_to_run = :timer.tc(fn -> FlightPhoenixServer.InsertionSort.sort(results) end, [])
   # {time_in_micros, _,} = time_to_run
   # IO.puts "INSERT: #{time_in_micros / 1000}ms to run"

   # time_to_run = :timer.tc(fn -> FlightPhoenixServer.ShellSort.sort(results) end, [])
   # {time_in_micros, _,} = time_to_run
   # IO.puts "SHELL: #{time_in_micros / 1000}ms to run"

  #  time_to_run = :timer.tc(fn -> FlightPhoenixServer.BubbleSort.sort(results) end, [])
  #  {time_in_micros, _,} = time_to_run
  #  IO.puts "BUBBLE: #{time_in_micros / 1000}ms to run"

    conn
    |> json(%{results: FlightPhoenixServer.InsertionSort.sort(results)})
  end

  defp flight_results(provider) do
    response = HTTPotion.get "localhost:9000/scrapers/#{provider}"
    parsed_response = Poison.decode!(response.body)
    parsed_response["results"]
  end

end


# providers = ["expedia", "orbitz", "priceline", "travelocity", "united"]
# res = []
# providers.each do |provider|
#  task = Task.async(fn -> flight_results(provider) end )
#  result = Task.await(task)
#  res << result
# end
#
## RUBY
# providers.map {|provider| provider + " airline"}
#
## ELIXIR
# providers
# |> Enum.map(fn(provider) -> provider + " airline" )
