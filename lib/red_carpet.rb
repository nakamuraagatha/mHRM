require 'red_carpet/access_control'


# Permissions
RedCarpet::AccessControl.map do |map|
  map.permission :view_educations, {:educations => [:index]},  :read => true
  map.permission :manage_educations, {:educations => [:new, :create, :edit, :update, :destroy]},  :read => true

  map.permission :view_departments, {:educations => [:index]},  :read => true
  map.permission :manage_departments, {:educations => [:new, :create, :edit, :update, :destroy]},  :read => true

  map.permission :view_organizations, {:educations => [:index]},  :read => true
  map.permission :manage_organizations, {:educations => [:new, :create, :edit, :update, :destroy]},  :read => true

 map.permission :view_positions, {:educations => [:index]},  :read => true
  map.permission :manage_positions, {:educations => [:new, :create, :edit, :update, :destroy]},  :read => true

  map.permission :view_documents, {:educations => [:index]},  :read => true
  map.permission :manage_documents, {:educations => [:new, :create, :edit, :update, :destroy]},  :read => true

end