class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books, :id => false do |t|
      t.references :author, :null => false
      t.references :book, :null => false
    end

    #Adding indexes can massively speed up join tables
    #Speeds-up author->books lookups
    add_index :authors_books, [:author_id, :book_id], :unique => true
    #Speeds-up book->authors lookups
    add_index :authors_books, [:book_id, :author_id], :unique => true
  end
end
