class AddOrganizationIdToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :departments, :organization_id, :integer
  end
end
