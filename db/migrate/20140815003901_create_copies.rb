class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.integer :book_id
      t.string :isbn
      t.integer :edition
      t.string :amazon_id
      t.string :location_id
      t.string :owner_id

      t.timestamps
    end
  end
end
