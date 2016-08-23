class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :email_address
      t.integer :email_type_id
      t.belongs_to :extend_demography, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
