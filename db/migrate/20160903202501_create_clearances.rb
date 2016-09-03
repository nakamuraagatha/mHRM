class CreateClearances < ActiveRecord::Migration[5.0]
  def change
    create_table :clearances do |t|
      t.integer :clearence_type_id
      t.integer :user_id
      t.date :date_received
      t.text :note
      t.date :date_expired

      t.timestamps
    end
  end
end
