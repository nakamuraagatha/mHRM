class CreateJobDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :job_details do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :department, foreign_key: true
      t.belongs_to :role, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
