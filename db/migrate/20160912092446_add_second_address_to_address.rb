class AddSecondAddressToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :second_address, :string
  end
end
