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
  end
end
