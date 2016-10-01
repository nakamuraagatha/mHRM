class AddDescriptionToCase < ActiveRecord::Migration[5.0]
  def change
    add_column :cases, :description, :text
  end
end
