class CreateChecklistAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :checklist_answers do |t|
      t.boolean :status
      t.integer :user_id
      t.integer :checklist_id
      t.integer :checklist_template_id
      t.date :due_date

      t.timestamps
    end
  end
end
