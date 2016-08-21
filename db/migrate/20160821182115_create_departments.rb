class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.integer :user_id
      t.text :note
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
