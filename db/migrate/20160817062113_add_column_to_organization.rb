class AddColumnToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :organization_type_id, :integer
    add_column :organizations, :address_type_id, :integer
  end
end
