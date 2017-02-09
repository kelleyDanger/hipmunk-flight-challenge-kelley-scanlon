defmodule HipmunkKelley.SearchController do
  use HipmunkKelley.Web, :controller
  require IEx

  def index(conn, _params) do
    providers = ["expedia", "orbitz", "priceline", "travelocity", "united"]
    # Get all 6 responses in json form
    results = Enum.flat_map(providers, fn(provider) ->
      flight_results(provider)
    end)

    results =
      providers
      |> Enum.flat_map(fn(provider) ->
        flight_results(provider)
      end)
      |> Enum.sort_by(&Map.get(&1, "agony"))

    conn
    |> json(results)
  end

  defp flight_results(provider) do
    response = HTTPotion.get "localhost:9000/scrapers/#{provider}"
    parsed_response = Poison.decode!(response.body)
    parsed_response["results"]
  end
end
