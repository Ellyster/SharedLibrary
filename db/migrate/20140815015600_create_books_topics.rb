class CreateBooksTopics < ActiveRecord::Migration
  def change
    create_table :books_topics, :id => false do |t|
      t.references :book, :null => false
      t.references :topic, :null => false
    end

    #Adding indexes can massively speed up join tables
    #Speeds-up book->topics lookups
    add_index :books_topics, [:book_id, :topic_id], :unique => true
    #Speeds-up topic->books lookups
    add_index :books_topics, [:topic_id, :book_id], :unique => true
  end
end
