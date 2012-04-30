class CreateSchoolProfiles < ActiveRecord::Migration
  def change
    create_table :school_profiles do |t|
      t.string :name
      t.string :program
      t.integer :year
      t.decimal :gpa
      t.integer :user_id

      t.timestamps
    end
  end
end
