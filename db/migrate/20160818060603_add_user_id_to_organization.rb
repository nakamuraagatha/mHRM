class AddUserIdToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :user_id, :integer
  end
end
