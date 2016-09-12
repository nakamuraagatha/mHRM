class ChangeAddressType < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :address_type, :address_type_id
  end
end
