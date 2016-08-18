class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :document_type_id
      t.date :date
      t.string :attachment

      t.timestamps
    end
  end
end
