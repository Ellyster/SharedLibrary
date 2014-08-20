class Category < ActiveRecord::Base
  has_many :topics, -> {order 'name ASC'}, dependent: :destroy

  default_scope ->{order 'name ASC'}

  def has_books?
    return true if topics.any? {|topic| topic.has_books?}
    return false
  end

  def books
    category_books = []

    topics.each do |topic|
      topic.books.each do |book|
        category_books.push(book) unless category_books.include?(book)
      end
    end

    return category_books
  end

  validates :name,
            presence: true,
            uniqueness: true

end
