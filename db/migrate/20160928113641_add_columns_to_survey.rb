class AddColumnsToSurvey < ActiveRecord::Migration[5.0]
  def change
    add_column :survey_surveys, :assigned_to_id, :integer
    add_column :survey_surveys, :survey_type_id, :integer
  end
end
