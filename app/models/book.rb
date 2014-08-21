class Book < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :language
  has_many :editions, -> {order 'edition DESC'}, dependent: :destroy
  has_many :rindokus, -> {order 'year ASC'}, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :authors, :uniq => true
  has_and_belongs_to_many :topics, -> {order 'name ASC'}, :uniq => true

  default_scope ->{order 'title ASC'}
  scope :filter, ->(topic_name){joins(:topics).where('topics.name = ?', topic_name) if topic_name}
  scope :recent, ->(days_amount){where('created_at >= ?', days_amount.to_i.days.ago) if days_amount}

  before_save :set_keywords

  after_create :all_topics_reset_books_count
  after_destroy :all_topics_reset_books_count
  before_update :all_topics_reset_books_count
  after_update :all_topics_reset_books_count

  validates :title,
            presence: true,
            uniqueness: true

  validates :blurb,
            presence: true

  validates :publisher_id,
            presence: true

  validates :language_id,
            presence: true

  def all_topics_reset_books_count
    self.topics.each(&:reset_books_count)
    self.topics.each(&:save)

    self.topics.each {|t| t.category.reset_books_count}
    self.topics.each {|t| t.category.save}
  end

  def reset_reviews_count
    self.reviews_count = reviews.count
  end

  def reset_avg_score
    self.score_avg = reviews.average(:score)
  end

  def reset_active_copies_count
    if editions.count > 0
          self.active_copies_count = self.editions.each.map {|e| e.copies.where(lost: false).count}.reduce(:+)
    end
  end

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
    active_copies_count > 0
  end

  def score(is_css: false, with_rounding: false)

    if reviews_count > 0
      return score_avg.round if with_rounding || is_css
      return score_avg.round(2)
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
