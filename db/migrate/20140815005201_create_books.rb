class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :paperback
      t.integer :publisher_id
      t.integer :language_id

      t.timestamps
    end
  end
end
