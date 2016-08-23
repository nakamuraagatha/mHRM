class AddExtendDemoToIdentififcation < ActiveRecord::Migration[5.0]
  def change
    add_reference :identifications, :extend_demography, foreign_key: true
    remove_reference :extend_demographies, :identification, foreign_key: true
  end
end
