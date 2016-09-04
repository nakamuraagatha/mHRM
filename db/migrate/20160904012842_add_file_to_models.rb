class AddFileToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :educations, :file, :string
    add_column :clearances, :file, :string
    add_column :certifications, :file, :string
  end
end
