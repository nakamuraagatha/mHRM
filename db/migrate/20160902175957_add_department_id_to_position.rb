class AddDepartmentIdToPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :department_id, :integer
  end
end
