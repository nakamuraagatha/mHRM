class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.integer :user_id
      t.integer :language_type_id
      t.integer :proficiency_id
      t.text :note

      t.timestamps
    end
  end
end
