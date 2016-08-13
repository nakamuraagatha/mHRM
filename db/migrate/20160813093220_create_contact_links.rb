class CreateContactLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_links do |t|
      t.integer :contact_to_id
      t.integer :contact_from_id
      t.integer :contact_type_id

      t.timestamps
    end
  end
end
