class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :education_type
      t.string :certification
      t.string :other_skill
      t.date :date_recieved
      t.date :date_expired
      t.text :note
      t.integer :clearence

      t.timestamps
    end
  end
end
