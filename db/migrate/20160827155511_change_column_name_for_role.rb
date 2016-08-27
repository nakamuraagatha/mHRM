class ChangeColumnNameForRole < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :role_type_id, :integer
    remove_column :roles, :name, :string
  end
end
