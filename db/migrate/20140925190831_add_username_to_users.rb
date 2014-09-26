class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :name, unique: true
  end
end
