class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books, :id => false do |t|
      t.references :author_id
      t.references :book_id
    end
  end
end
