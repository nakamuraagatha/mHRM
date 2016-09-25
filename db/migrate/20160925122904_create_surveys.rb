class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.integer :survey_type_id
      t.text :question
      t.integer :user_id
      t.integer :assigned_to_id
      t.date :due_date
      t.date :date_completed

      t.timestamps
    end
  end
end
