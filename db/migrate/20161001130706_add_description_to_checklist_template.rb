class AddDescriptionToChecklistTemplate < ActiveRecord::Migration[5.0]
  def change
    add_column :checklist_templates, :description, :text
  end
end
