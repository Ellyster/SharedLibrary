class Copy < ActiveRecord::Base
  belongs_to :edition
  belongs_to :location
  belongs_to :owner

  validates :edition_id,
            presence: true

  validates :location_id,
            presence: true

  validates :owner_id,
            presence: true

  #validates :lost,
            #presence: true

end
