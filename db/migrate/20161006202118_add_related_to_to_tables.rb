class AddRelatedToToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :related_to_id, :integer
    add_column :tasks, :related_to_type, :string

    add_column :checklist_templates, :related_to_id, :integer
    add_column :checklist_templates, :related_to_type, :string

    add_column :survey_surveys, :related_to_id, :integer
    add_column :survey_surveys, :related_to_type, :string

    add_column :documents, :related_to_id, :integer
    add_column :documents, :related_to_type, :string
  end
end
