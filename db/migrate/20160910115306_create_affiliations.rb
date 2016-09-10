class CreateAffiliations < ActiveRecord::Migration[5.0]
  def change
    create_table :affiliations do |t|
      t.integer :user_id
      t.string :name
      t.integer :affiliation_type_id
      t.text :note

      t.timestamps
    end
  end
end
