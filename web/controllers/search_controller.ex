defmodule Mongue.SearchController do
  use Mongue.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", items: %{}
  end

  def search(conn, params) do
    api_key = "d692fc1d9a302e26c4ea268cab4e2e37"
    url = "https://apis.daum.net/search/book?"
    output_type = "json"
    cate_id = "47"
    search_type = "title"
    sort = "popular"
    # params["search"]["keyword"] = String.replace params["search"]["keyword"], " ", "+"
    IO.puts params[:search][:keyword]
    full_url = "#{url}apikey=#{api_key}&q=\"#{URI.encode params["search"]["keyword"]}\"&output=#{output_type}"
              <> "&cate_id=#{cate_id}&search_type=#{search_type}&sort=#{sort}"

    case HTTPoison.get!(full_url) do

      %HTTPoison.Response{status_code: 200, body: body} ->
        %{"channel" => %{"item" => items}} = Poison.decode!(body)
        render conn, "index.html", items: items

      %HTTPoison.Response{status_code: 404} ->
        IO.puts "Not found :("
      %HTTPoison.Error{reason: reason} ->
        IO.insepct reason
      _ -> IO.puts "what"
    end

  end
end
