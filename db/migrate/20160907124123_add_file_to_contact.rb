class AddFileToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :file, :string
  end
end
