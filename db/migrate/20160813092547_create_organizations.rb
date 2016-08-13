class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :address_id
      t.text :note
      t.integer :contact_id

      t.timestamps
    end
  end
end
