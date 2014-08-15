class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :room
      t.string :bookshelf
      t.string :shelf

      t.timestamps
    end
  end
end
