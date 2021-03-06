class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.integer :edition_id
      t.string :location_id
      t.string :owner_id
      t.boolean :lost, :default => false

      t.timestamps
    end

    add_index :copies, :edition_id
    add_index :copies, :owner_id
    add_index :copies, :location_id
  end
end
