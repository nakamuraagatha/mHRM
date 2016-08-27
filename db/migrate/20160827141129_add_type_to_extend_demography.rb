class AddTypeToExtendDemography < ActiveRecord::Migration[5.0]
  def change
    add_column :extend_demographies, :type, :string
  end
end
