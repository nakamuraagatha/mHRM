class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :type
      t.integer :owner_id
      t.text :note
      t.integer :user_id

      t.timestamps
    end
    add_index :notes, :type
    add_index :notes, :owner_id
    add_index :notes, :user_id
  end
end
