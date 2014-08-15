json.array!(@books) do |book|
  json.extract! book, :id, :title, :paperback, :publisher_id, :language_id
  json.url book_url(book, format: :json)
end
