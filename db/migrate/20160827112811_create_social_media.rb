class CreateSocialMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :social_media do |t|
      t.integer :social_media_type_id
      t.text :note
      t.string :social_media_handle
      t.integer :extend_demography_id

      t.timestamps
    end
  end
end
