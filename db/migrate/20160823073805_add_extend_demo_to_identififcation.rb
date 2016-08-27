class AddExtendDemoToIdentififcation < ActiveRecord::Migration[5.0]
  def change
    add_column :identifications, :extend_demography_id, :integer
  end
end
