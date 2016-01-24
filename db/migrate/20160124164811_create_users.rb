class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :provider
      t.string :platform
      t.string :username
      t.string :email
      t.timestamps null: false
    end

    add_index :users, :provider
    add_index :users, :uid
    add_index :users, [:provider, :uid], unique: true

  end
end
