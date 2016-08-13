class CreateCoreDemographics < ActiveRecord::Migration[5.0]
  def change
    create_table :core_demographics do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :gender_id
      t.date :birth_date
      t.integer :religion_id
      t.string :title
      t.text :note
      t.integer :ethnicity_id

      t.timestamps
    end
  end
end
