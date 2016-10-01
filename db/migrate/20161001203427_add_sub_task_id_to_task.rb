class AddSubTaskIdToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :sub_task_id, :integer
  end
end
