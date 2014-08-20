class Book < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :language
  has_many :editions, -> {order 'edition DESC'}, dependent: :destroy
  has_many :rindokus, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :authors, :uniq => true
  has_and_belongs_to_many :topics, -> {order 'name ASC'}, :uniq => true

  default_scope ->{order 'title ASC'}

  before_save :set_keywords

  validates :title,
            presence: true,
            uniqueness: true

  validates :blurb,
            presence: true

  validates :publisher_id,
            presence: true

  validates :language_id,
            presence: true

  def self.search(keyword)
    if keyword.present?

      books = []

      Book.where('keywords LIKE ?',"%#{keyword.downcase}%").each do |book|
        books.push(book) unless books.include?(book)
      end

      Author.where('keywords LIKE ?',"%#{keyword.downcase}%").each do |author|
        author.books.each do |book|
          books.push(book) unless books.include?(book)
        end
      end

      Edition.where('isbn13 LIKE ?',"%#{keyword}%").each do |edition|
        books.push(edition.book) unless books.include?(edition.book)
      end

      return books

    else
      return Book.all
    end
  end

  def amazon_id
    editions.first.amazon_id
  end

  def is_recent?
    return true if created_at >= 30.days.ago
    return false
  end

  def has_active_copies?
    return true if editions.any? {|edition| edition.has_active_copies?}
    return false
  end

  def scored?
    return true if reviews.count > 0
    return false
  end

  def score(is_css: false, with_rounding: false)

    if scored?
      avgscore = 0.0

      reviews.each do |review|
        avgscore += review.score
      end

      avgscore /= reviews.count

      return avgscore.round if with_rounding || is_css
      return avgscore.round(2)
    else
      return 'no-score' if is_css
      return '?'
    end

  end

  protected
  def set_keywords
    self.keywords = [title, blurb].map(&:downcase).join(' ')
  end


end
