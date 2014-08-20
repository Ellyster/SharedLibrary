json.array!(@copies) do |copy|
  json.extract! copy, :id, :edition_id, :location_id, :owner_id
  json.url copy_url(copy, format: :json)
end
