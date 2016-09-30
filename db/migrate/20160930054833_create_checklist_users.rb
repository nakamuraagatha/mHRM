class CreateChecklistUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :checklist_users do |t|
      t.integer :assigned_to_id
      t.integer :checklist_template_id

      t.timestamps
    end

    add_column :checklist_templates, :title, :string
  end
end
