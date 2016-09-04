class CreateOtherSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :other_skills do |t|
      t.integer :user_id
      t.string :name
      t.date :date_received
      t.date :date_expired
      t.text :note
      t.string :file

      t.timestamps
    end
  end
end
