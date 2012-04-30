class CreateCollegeProfiles < ActiveRecord::Migration
  def change
    create_table :college_profiles do |t|
      t.string :name
      t.string :degree
      t.integer :year
      t.decimal :gpa
      t.integer :user_id

      t.timestamps
    end
  end
end
