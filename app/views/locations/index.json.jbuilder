json.array!(@locations) do |location|
  json.extract! location, :id, :room, :bookshelf, :shelf
  json.url location_url(location, format: :json)
end
