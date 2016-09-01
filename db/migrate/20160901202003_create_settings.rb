class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.text :home_page_content

      t.timestamps
    end
  end
end
