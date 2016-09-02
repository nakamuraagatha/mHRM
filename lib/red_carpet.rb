require 'red_carpet/access_control'


# Permissions
RedCarpet::AccessControl.map do |map|
  map.project_module :educations do |map|
    map.permission :view_educations,   {:educations => [:index]},  :read => true
    map.permission :create_educations, {:educations => [:new, :create]},  :read => true
    map.permission :edit_educations,   {:educations => [:edit, :update]},  :read => true
    map.permission :delete_educations, {:educations => [ :destroy]},  :read => true
    map.permission :manage_educations, {:educations => [:new, :create, :edit, :update, :destroy]},  :read => true
  end
  map.project_module :departments do |map|
    map.permission :view_departments,   {:departments => [:index]},  :read => true
    map.permission :create_departments, {:departments => [:new, :create]},  :read => true
    map.permission :edit_departments,   {:departments => [:edit, :update]},  :read => true
    map.permission :delete_departments, {:departments => [:destroy]},  :read => true
    map.permission :manage_departments, {:departments => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :employees do |map|
    map.permission :view_employees,   {:employees => [:index]},  :read => true
    map.permission :create_employees, {:departments => [:new, :create]},  :read => true
    map.permission :edit_employees,   {:departments => [:edit, :update]},  :read => true
    map.permission :delete_employees, {:departments => [:destroy]},  :read => true
    map.permission :manage_employees, {:departments => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :organizations do |map|
    map.permission :view_organizations, {:organizations => [:index]},  :read => true
    map.permission :create_organizations, {:organizations => [:new, :create]},  :read => true
    map.permission :edit_organizations, {:organizations => [:edit, :update]},  :read => true
    map.permission :delete_organizations, {:organizations => [:destroy]},  :read => true
    map.permission :manage_organizations, {:organizations => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :positions do |map|
    map.permission :view_positions, {:positions => [:index]},  :read => true
    map.permission :create_positions, {:positions => [:new, :create]},  :read => true
    map.permission :edit_positions, {:positions => [:edit, :update]},  :read => true
    map.permission :delete_positions, {:positions => [:destroy]},  :read => true
    map.permission :manage_positions, {:positions => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :document do |map|
    map.permission :view_documents,   {:documents => [:index]},  :read => true
    map.permission :create_documents, {:documents => [:new, :create]},  :read => true
    map.permission :edit_documents,   {:documents => [ :edit, :update]},  :read => true
    map.permission :delete_documents, {:documents => [ :destroy]},  :read => true
    map.permission :manage_documents, {:documents => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :contacts do |map|
    map.permission :view_contacts, {:contacts => [:index]},  :read => true
    map.permission :create_contacts, {:contacts => [:new, :create]},  :read => true
    map.permission :edit_contacts, {:contacts => [:edit, :update]},  :read => true
    map.permission :delete_contacts, {:contacts => [:destroy]},  :read => true
    map.permission :manage_contacts, {:contacts => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :employee do |map|
    map.permission :manage_roles, {:employees => [:index]},  :read => true
 end

end