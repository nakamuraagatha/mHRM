class CreateChecklists < ActiveRecord::Migration[5.0]
  def change
    create_table :checklists do |t|
      t.boolean :status
      t.string :description
      t.date :due_date
      t.integer :user_id
      t.integer :checklist_template_id

      t.timestamps
    end
  end
end
