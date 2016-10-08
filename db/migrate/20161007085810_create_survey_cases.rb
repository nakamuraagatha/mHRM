class CreateSurveyCases < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_cases do |t|
      t.integer :assigned_to_id
      t.integer :survey_id

      t.timestamps
    end
  end
end
