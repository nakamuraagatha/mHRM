class AddPayRateIfToPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :pay_rate_id, :integer
  end
end
