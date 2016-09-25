class CreateChecklistTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :checklist_templates do |t|
      t.string :checklist_type
      t.integer :user_id

      t.timestamps
    end
  end
end
