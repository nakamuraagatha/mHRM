class CreateSurveyUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_users do |t|
      t.integer :assigned_to_id
      t.integer :survey_id

      t.timestamps
    end
    add_index :survey_users, :assigned_to_id
  end
end
