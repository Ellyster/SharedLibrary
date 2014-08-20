class Topic < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :books, :uniq => true

  def has_books?
    return false if books.count == 0
    return true 
  end

  validates :name,
            presence: true,
            uniqueness: true

  validates :category_id,
            presence: true

end
