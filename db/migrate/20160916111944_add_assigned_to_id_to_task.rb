class AddAssignedToIdToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :assigned_to_id, :integer
  end
end
