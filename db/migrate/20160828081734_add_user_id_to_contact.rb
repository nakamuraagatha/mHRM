class AddUserIdToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :user_id, :integer
    rename_column :contacts, :activity_id, :contact_type_id
  end
end
