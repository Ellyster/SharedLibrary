class Topic < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :books, :uniq => true

  after_create :category_reset_books_count
  after_destroy :category_reset_books_count
  before_update :category_reset_books_count
  after_update :category_reset_books_count

  validates :name,
            presence: true,
            uniqueness: true

  validates :category_id,
            presence: true

  def category_reset_books_count
    self.category.reset_books_count
    self.category.save
  end

  def reset_books_count
    self.books_count = books.count
  end

  def has_books?
    books_count > 0
  end

end
