class AddDepartmentTypeIdToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :departments, :department_type_id, :integer
    add_column :extend_demographies, :department_id, :integer
  end
end
