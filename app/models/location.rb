class Location < ActiveRecord::Base
  has_many :copies

  validates :room,
            presence: true

end
