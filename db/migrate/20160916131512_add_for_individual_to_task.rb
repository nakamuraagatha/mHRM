class AddForIndividualToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :for_individual_id, :integer
  end
end
