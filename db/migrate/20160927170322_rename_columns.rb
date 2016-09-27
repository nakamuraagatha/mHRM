class RenameColumns < ActiveRecord::Migration
  def change
    begin
      rename_table :survey_answers, :journal_answers
      rename_table :surveys, :journals
      rename_column :journals, :survey_type_id, :journal_type_id
      rename_column :journal_answers, :survey_id, :journal_id
    end
  end
end
