class Author < ActiveRecord::Base
  has_and_belongs_to_many :books, :uniq => true

  validates :name,
            presence: true,
            uniqueness: true

  before_save :set_keywords

  protected
  def set_keywords
    self.keywords = name.downcase
  end

end
