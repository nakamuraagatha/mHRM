class AddExtendDemographyIdToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :extend_demography_id,  :integer
  end
end
