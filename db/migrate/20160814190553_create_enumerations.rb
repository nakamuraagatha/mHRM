class CreateEnumerations < ActiveRecord::Migration[5.0]
  def change
    create_table "enumerations", force: :cascade do |t|
      t.string  "name",          limit: 30,  default: "",    null: false
      t.integer "position",      limit: 4
      t.boolean "is_default",                default: false, null: false
      t.string  "type",          limit: 255
      t.boolean "active",                    default: true,  null: false
      t.string  "position_name", limit: 30
    end
  end
end
