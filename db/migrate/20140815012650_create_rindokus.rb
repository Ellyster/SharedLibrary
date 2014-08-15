class CreateRindokus < ActiveRecord::Migration
  def change
    create_table :rindokus do |t|
      t.date :year
      t.string :semester
      t.integer :book_id

      t.timestamps
    end
  end
end
