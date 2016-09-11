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

  map.project_module :languages do |map|
    map.permission :view_languages, {:languages => [:index]},  :read => true
    map.permission :create_languages, {:languages => [:new, :create]},  :read => true
    map.permission :edit_languages, {:languages => [:edit, :update]},  :read => true
    map.permission :delete_languages, {:languages => [:destroy]},  :read => true
    map.permission :manage_languages, {:languages => [:new, :create, :edit, :update, :destroy]},  :read => true
  end
  
  # map.project_module :departments do |map|
  #   map.permission :view_departments,   {:departments => [:index]},  :read => true
  #   map.permission :create_departments, {:departments => [:new, :create]},  :read => true
  #   map.permission :edit_departments,   {:departments => [:edit, :update]},  :read => true
  #   map.permission :delete_departments, {:departments => [:destroy]},  :read => true
  #   map.permission :manage_departments, {:departments => [:new, :create, :edit, :update, :destroy]},  :read => true
  # end
  #
  # map.project_module :organizations do |map|
  #   map.permission :view_organizations, {:organizations => [:index]},  :read => true
  #   map.permission :create_organizations, {:organizations => [:new, :create]},  :read => true
  #   map.permission :edit_organizations, {:organizations => [:edit, :update]},  :read => true
  #   map.permission :delete_organizations, {:organizations => [:destroy]},  :read => true
  #   map.permission :manage_organizations, {:organizations => [:new, :create, :edit, :update, :destroy]},  :read => true
  # end

  map.project_module :affiliations do |map|
    map.permission :view_affiliations, {:affiliations => [:index]},  :read => true
    map.permission :create_affiliations, {:affiliations => [:new, :create]},  :read => true
    map.permission :edit_affiliations, {:affiliations => [:edit, :update]},  :read => true
    map.permission :delete_affiliations, {:affiliations => [:destroy]},  :read => true
    map.permission :manage_affiliations, {:affiliations => [:new, :create, :edit, :update, :destroy]},  :read => true
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

  map.project_module :certifications do |map|
    map.permission :view_certifications, {:certifications => [:index]},  :read => true
    map.permission :create_certifications, {:certifications => [:new, :create]},  :read => true
    map.permission :edit_certifications, {:certifications => [:edit, :update]},  :read => true
    map.permission :delete_certifications, {:certifications => [:destroy]},  :read => true
    map.permission :manage_certifications, {:certifications => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :clearances do |map|
    map.permission :view_clearances, {:clearances => [:index]},  :read => true
    map.permission :create_clearances, {:clearances => [:new, :create]},  :read => true
    map.permission :edit_clearances, {:clearances => [:edit, :update]},  :read => true
    map.permission :delete_clearances, {:clearances => [:destroy]},  :read => true
    map.permission :manage_clearances, {:clearances => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :other_skills do |map|
    map.permission :view_other_skills, {:other_skills => [:index]},  :read => true
    map.permission :create_other_skills, {:other_skills => [:new, :create]},  :read => true
    map.permission :edit_other_skills, {:other_skills => [:edit, :update]},  :read => true
    map.permission :delete_other_skills, {:other_skills => [:destroy]},  :read => true
    map.permission :manage_other_skills, {:other_skills => [:new, :create, :edit, :update, :destroy]},  :read => true
  end

  map.project_module :employee do |map|
    map.permission :manage_roles, {:employees => [:index],
                                   :educations => [:index,:new, :create, :edit, :update, :destroy],
                                   :languages => [:index,:new, :create, :edit, :update, :destroy],
                                   :affiliations => [:index,:new, :create, :edit, :update, :destroy],
                                   :clearances => [:index,:new, :create, :edit, :update, :destroy],
                                   :certifications => [:index,:new, :create, :edit, :update, :destroy],
                                   :contacts => [:index,:new, :create, :edit, :update, :destroy],
                                   :document => [:index,:new, :create, :edit, :update, :destroy],
                                   :positions => [:index,:new, :create, :edit, :update, :destroy],


    },  :read => true
  end

end