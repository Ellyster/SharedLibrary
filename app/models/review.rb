class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  after_create :book_reset_reviews_count
  after_create :book_reset_avg_score
  after_destroy :book_reset_reviews_count
  after_destroy :book_reset_avg_score
  after_update :book_reset_reviews_count
  after_update :book_reset_avg_score

  validates :user_id,
            presence: true

  validates :book_id,
            presence: true

  validates :score,
            presence: true

  validates :comment,
            presence: true

  def book_reset_reviews_count
    self.book.reset_reviews_count
    self.book.save
  end

  def book_reset_avg_score
    self.book.reset_avg_score
    self.book.save
  end

end
