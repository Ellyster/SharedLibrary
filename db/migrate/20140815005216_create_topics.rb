class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end

    add_index :topics, :category_id
  end
end
