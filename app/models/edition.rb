class Edition < ActiveRecord::Base
  belongs_to :book
  has_many :copies, dependent: :destroy

  def has_active_copies?
    return true if copies.any? {|copy| copy.lost == false}
    return false
  end

  validates :book_id,
            presence: true

  validates :isbn13,
            presence: true

  validates :edition,
            presence: true

  validates :cover,
            presence: true,
            inclusion: { in: %w(Hardback Paperback), message: "%{value} is not a valid covertype" }
end
