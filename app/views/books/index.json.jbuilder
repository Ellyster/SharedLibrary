json.array!(@books) do |book|
  json.extract! book, :id, :title, :blurb, :publisher_id, :language_id
  json.url book_url(book, format: :json)
end
