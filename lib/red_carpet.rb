require 'red_carpet/access_control'


# Permissions
RedCarpet::AccessControl.map do |map|
  map.project_module :educations do |map|
    map.permission :view_educations, {:educations => [:index]},  :read => true
    map.permission :manage_educations, {:educations => [:new, :create, :edit, :update, :destroy]},  :read => true
  end
  map.project_module :departments do |map|
    map.permission :view_departments, {:departments => [:index]},  :read => true
    map.permission :manage_departments, {:departments => [:new, :create, :edit, :update, :destroy]},  :read => true
  end
  map.project_module :organizations do |map|
    map.permission :view_organizations, {:organizations => [:index]},  :read => true
    map.permission :manage_organizations, {:organizations => [:new, :create, :edit, :update, :destroy]},  :read => true
  end
  map.project_module :positions do |map|
    map.permission :view_positions, {:positions => [:index]},  :read => true
    map.permission :manage_positions, {:positions => [:new, :create, :edit, :update, :destroy]},  :read => true
  end
  map.project_module :document do |map|
    map.permission :view_documents, {:documents => [:index]},  :read => true
    map.permission :manage_documents, {:documents => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :contacts do |map|
    map.permission :view_contacts, {:contacts => [:index]},  :read => true
    map.permission :manage_contacts, {:contacts => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

end