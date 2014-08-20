class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.integer :book_id
      t.string :isbn13
      t.integer :edition
      t.string :cover
      t.string :amazon_id

      t.timestamps
    end
  end
end
