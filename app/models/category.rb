require 'set'

class Category < ActiveRecord::Base
  has_many :topics, -> {order 'name ASC'}, dependent: :destroy

  default_scope ->{order 'name ASC'}


  validates :name,
            presence: true,
            uniqueness: true

  def reset_books_count
    books_ids = Set.new

    topics.each do |t|
      t.books.each do |b|
        books_ids << b.id
      end
    end

    self.books_count = books_ids.count
  end

  def has_books?
    books_count > 0
  end

#  def books
#    category_books = []
#
#    topics.each do |topic|
#      topic.books.each do |book|
#        category_books.push(book) unless category_books.include?(book)
#      end
#    end
#
#    return category_books
#  end

end
