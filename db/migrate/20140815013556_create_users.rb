class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.boolean :librarian, :default => false
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
