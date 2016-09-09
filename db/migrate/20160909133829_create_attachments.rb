class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :type
      t.string :file
      t.string :description
      t.integer :owner_id

      t.timestamps
    end
  end
end
