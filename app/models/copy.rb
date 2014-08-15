class Copy < ActiveRecord::Base
  belongs_to :book
  belongs_to :location
  belongs_to :owner

end
