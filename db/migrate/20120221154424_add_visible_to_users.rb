class AddVisibleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :visible, :text
  end
end
