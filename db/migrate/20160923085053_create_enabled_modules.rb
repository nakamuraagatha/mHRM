class CreateEnabledModules < ActiveRecord::Migration[5.0]
  def change
    create_table :enabled_modules do |t|
      t.string :name
      t.boolean :status, default: true

      t.timestamps
    end
    modules = %w{affiliations clearances certifications contacts educations other_skills positions languages tasks documents}
    modules.each do |em|
      EnabledModule.create(name: em)
    end
  end
end
