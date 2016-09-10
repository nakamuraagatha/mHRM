class AddEmploymentTypeIdToPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :employment_type_id, :integer
  end
end
