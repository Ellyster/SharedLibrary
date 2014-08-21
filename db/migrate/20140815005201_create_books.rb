class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :blurb
      t.integer :publisher_id
      t.integer :language_id
      t.text :keywords

      t.timestamps
    end

    add_index :books, :publisher_id
    add_index :books, :language_id
  end
end
