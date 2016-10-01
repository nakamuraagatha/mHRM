class AddStatusTypeToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :task_status_type_id, :integer
  end
end
