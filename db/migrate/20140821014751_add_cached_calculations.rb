class AddCachedCalculations < ActiveRecord::Migration
  def up
    add_column :editions, :active_copies_count, :integer, default: 0, null: false

    #Edition.find_each(select: 'id') do |result|
    #  result.reset_active_copies_count()
    #end

    add_column :books, :active_copies_count, :integer, default: 0, null: false
    add_column :books, :reviews_count, :integer, default: 0, null: false
    add_column :books, :score_avg, :float, default: 0.0, null: false

    #Book.find_each(select: 'id') do |result|
    #  result.reset_active_copies_count()
    #  result.reset_reviews_count()
    #  result.reset_score_avg()
    #end

    add_column :topics, :books_count, :integer, default: 0, null: false

    #Topic.find_each(select: 'id') do |result|
    #  result.reset_books_count()
    #end

    add_column :categories, :books_count, :integer, default: 0, null: false

    #Category.find_each(select: 'id') do |result|
    #  result.reset_books_count()
    #end

  end

  def down
    remove_column :editions, :active_copies_count
    remove_column :books, :active_copies_count
    remove_column :books, :reviews_count
    remove_column :books, :score_avg
    remove_column :topics, :books_count
    remove_column :categories, :books_count
  end
end
