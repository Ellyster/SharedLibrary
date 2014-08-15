class Book < ActiveRecord::Base
  has_many :copies
  belongs_to :publisher
  belongs_to :language
  has_and_belongs_to_many :autors
  has_and_belongs_to_many :topics
  has_many :rindokus
  has many :reviews

end
