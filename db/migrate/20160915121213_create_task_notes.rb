class CreateTaskNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :task_notes do |t|
      t.integer :user_id
      t.integer :task_id
      t.text :note

      t.timestamps
    end
    add_index :task_notes, :user_id
    add_index :task_notes, :task_id
  end
end
