class Owner < ActiveRecord::Base
  has_many :copies

  validates :name,
            presence: true,
            uniqueness: true

  validates :label,
            presence: true,
            uniqueness: true

end
