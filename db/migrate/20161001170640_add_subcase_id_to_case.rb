class AddSubcaseIdToCase < ActiveRecord::Migration[5.0]
  def change
    add_column :cases, :subcase_id, :integer
  end
end
