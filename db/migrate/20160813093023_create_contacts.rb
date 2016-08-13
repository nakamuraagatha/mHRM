class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.boolean :emergency_contact
      t.text :note

      t.timestamps
    end
  end
end
