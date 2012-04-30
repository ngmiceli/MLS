class AddUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, :null => false, :default => "user"
       
    add_index :users, :username, :unique => true
  end
end
