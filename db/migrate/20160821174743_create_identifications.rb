class CreateIdentifications < ActiveRecord::Migration[5.0]
  def change
    create_table :identifications do |t|
      t.string :identification_number
      t.boolean :status
      t.date :date_expired
      t.string :issued_by
      t.text :note
      t.integer :identification_type_id

      t.timestamps
    end
  end
end
