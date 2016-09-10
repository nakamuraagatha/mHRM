class ChangeDefaultState < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :state, false
  end
end
