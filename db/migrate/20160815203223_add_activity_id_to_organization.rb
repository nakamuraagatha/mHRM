class AddActivityIdToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :activity_id, :integer
  end
end
