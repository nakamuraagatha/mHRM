class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :address_type
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :state
      t.string :country_code

      t.timestamps
    end
  end
end
