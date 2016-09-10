class AddCitizenshipTypeIdToCoreDemography < ActiveRecord::Migration[5.0]
  def change
    add_column :core_demographics, :citizenship_type_id, :integer
  end
end
