class CreateEntendedDemographics < ActiveRecord::Migration[5.0]
  def change
    create_table :entended_demographics do |t|
      t.integer :identification_id
      t.integer :owner_id
      t.string  :owner_type

      t.timestamps
    end
  end
end
