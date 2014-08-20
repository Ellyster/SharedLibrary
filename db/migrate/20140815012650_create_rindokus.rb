class CreateRindokus < ActiveRecord::Migration
  def change
    create_table :rindokus do |t|
      t.integer :year
      t.string :semester
      t.integer :book_id

      t.timestamps
    end
  end
end
