json.array!(@rindokus) do |rindoku|
  json.extract! rindoku, :id, :year, :semester, :book_id
  json.url rindoku_url(rindoku, format: :json)
end
