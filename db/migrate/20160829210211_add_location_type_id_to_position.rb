class AddLocationTypeIdToPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :location_type_id, :integer
  end
end
