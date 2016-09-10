class AddAffiliationIdToExtendDemography < ActiveRecord::Migration[5.0]
  def change
    add_column :extend_demographies, :affiliation_id, :integer
  end
end
