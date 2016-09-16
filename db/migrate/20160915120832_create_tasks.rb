class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :task_type_id
      t.integer :priority_id
      t.date :date_start
      t.date :date_due
      t.integer :user_id
      t.date :date_completed

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
