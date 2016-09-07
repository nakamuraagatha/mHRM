class AddSalaryToPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :salary, :string
  end
end
