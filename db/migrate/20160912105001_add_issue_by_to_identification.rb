class AddIssueByToIdentification < ActiveRecord::Migration[5.0]
  def change
    add_column :identifications, :issued_by_type_id, :integer
    rename_column :identifications, :issued_by, :date_issued
  end
end
