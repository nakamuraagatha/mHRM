class AddCaseCategoryToCase < ActiveRecord::Migration[5.0]
  def change
    add_column :cases, :case_category_id, :integer
  end
end
