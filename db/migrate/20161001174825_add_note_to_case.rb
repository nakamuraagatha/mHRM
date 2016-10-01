class AddNoteToCase < ActiveRecord::Migration[5.0]
  def change
    add_column :cases, :note, :text
    add_column :cases, :case_status_type_id, :integer
  end
end
