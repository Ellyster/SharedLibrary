class Copy < ActiveRecord::Base
  belongs_to :edition
  belongs_to :location
  belongs_to :owner

  after_create :edition_reset_active_copies_count
  after_destroy :edition_reset_active_copies_count
  after_update :edition_reset_active_copies_count

  after_create :book_reset_active_copies_count
  after_destroy :book_reset_active_copies_count
  after_update :book_reset_active_copies_count

  validates :edition_id,
            presence: true

  validates :location_id,
            presence: true

  validates :owner_id,
            presence: true

  #validates :lost,
            #presence: true

  def edition_reset_active_copies_count
    self.edition.reset_active_copies_count
    self.edition.save
  end

  def book_reset_active_copies_count
    self.edition.book.reset_active_copies_count
    self.edition.book.save
  end

end
