class AddCertificationTypeToEducation < ActiveRecord::Migration[5.0]
  def change
    add_column :educations, :certification_type_id, :integer
    remove_column :educations, :certification, :string
  end
end
