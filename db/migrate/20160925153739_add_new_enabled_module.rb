class AddNewEnabledModule < ActiveRecord::Migration[5.0]
  def up
    EnabledModule.create(name: 'checklists')
    EnabledModule.create(name: 'surveys')
  end
end
