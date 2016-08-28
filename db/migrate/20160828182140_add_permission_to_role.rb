class AddPermissionToRole < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :permissions, :text, limit: 65535
  end
end
