class AddSexZipToUser < ActiveRecord::Migration
  def change
    add_column :users, :sex, :integer
    add_column :users, :zip, :string
  end
end
