class Edition < ActiveRecord::Base
  belongs_to :book
  has_many :copies, dependent: :destroy

  validates :book_id,
            presence: true

  validates :isbn13,
            presence: true

  validates :edition,
            presence: true

  validates :cover,
            presence: true,
            inclusion: { in: %w(Hardback Paperback), message: "%{value} is not a valid covertype" }

  def reset_active_copies_count
    self.active_copies_count = copies.where(lost: false).count
  end

  def has_active_copies?
    active_copies_count > 0
  end

end
