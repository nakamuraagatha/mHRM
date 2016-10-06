class CreateChecklistCases < ActiveRecord::Migration[5.0]
  def change
    create_table :checklist_cases do |t|
      t.integer :assigned_to_id
      t.integer :checklist_template_id

      t.timestamps
    end
  end
end
