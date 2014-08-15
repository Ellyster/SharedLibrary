class Book < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :language
  has_many :copies
  has_many :rindokus
  has_many :reviews
  has_and_belongs_to_many :autors, :uniq => true
  has_and_belongs_to_many :topics, :uniq => true

end
