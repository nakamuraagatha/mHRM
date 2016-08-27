class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.integer :phone_type_id
      t.integer :extend_demography_id
      t.text :note

      t.timestamps
    end
  end
end
