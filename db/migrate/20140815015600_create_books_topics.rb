class CreateBooksTopics < ActiveRecord::Migration
  def change
    create_table :books_topics, :id => false do |t|
      t.references :book_id
      t.references :topic_id
    end
  end
end
