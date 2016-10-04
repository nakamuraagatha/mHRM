class CreateCaseRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :case_relations do |t|
      t.integer :case_id
      t.string :relation_type
      t.integer :relation_id

      t.timestamps
    end
  end
end
