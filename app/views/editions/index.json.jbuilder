json.array!(@editions) do |edition|
  json.extract! edition, :id, :book_id, :isbn13, :edition, :cover, :amazon_id
  json.url edition_url(edition, format: :json)
end
