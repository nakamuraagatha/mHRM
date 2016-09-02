class AddNameToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :first_name, :string
    add_column :contacts, :middle_name, :string
    add_column :contacts, :last_name, :string
  end
end
