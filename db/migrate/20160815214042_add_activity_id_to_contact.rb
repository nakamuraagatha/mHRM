class AddActivityIdToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :activity_id, :integer
  end
end
