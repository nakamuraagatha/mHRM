class AddEducationTypeIdToEducation < ActiveRecord::Migration[5.0]
  def change
    add_column :educations, :education_type_id, :integer
  end
end
