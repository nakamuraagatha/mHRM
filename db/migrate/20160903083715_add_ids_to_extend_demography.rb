class AddIdsToExtendDemography < ActiveRecord::Migration[5.0]
  def change
    add_column :extend_demographies, :contact_id, :integer
    add_column :extend_demographies, :organization_id, :integer
  end
end
