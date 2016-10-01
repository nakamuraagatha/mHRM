class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :title
      t.integer :priority_id
      t.integer :case_type_id
      t.date :date_start
      t.date :date_due
      t.date :date_completed
      t.integer :assigned_to_id

      t.timestamps
    end
    EnabledModule.create(name: 'cases')
  end
end
