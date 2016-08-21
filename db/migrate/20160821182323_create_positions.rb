class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.string :title
      t.text :position_description
      t.string :location
      t.string :special_requirement
      t.text :note
      t.date :date_start
      t.date :date_end
      t.string :files

      t.timestamps
    end
  end
end
