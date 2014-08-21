class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :score
      t.text :comment

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :book_id
  end
end
