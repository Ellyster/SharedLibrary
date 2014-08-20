class Rindoku < ActiveRecord::Base
  belongs_to :book

  validates :year,
            presence: true

  validates :semester,
            presence: true,
            inclusion: { in: %w(Summer Winter), message: "%{value} is not a valid semester" }

  validates :book_id,
            presence: true
end
