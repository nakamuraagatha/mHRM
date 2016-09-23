module EmployeesHelper
  def render_action_link(user)
    output = '<div class="btn-group">
<button aria-expanded="true" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
												Action <span class="caret"></span>
											</button>
<ul class="dropdown-menu">'

    output<< '<li>'
    output<< link_to('All_informations', all_informations_path(format: 'pdf'))
    output<< link_to('PDF', employee_path(user, format: 'pdf'))
    output<<'</li>'

    if current_user.allowed_to?(:create_contacts)
      output<< '<li>'
      output<< link_to('New contact', new_employee_contact_path(user))
      output<<'</li>'
    end

    if current_user.allowed_to?(:create_educations)
      output<< '<li>'
      output<< link_to('New education', new_employee_education_path(user))
      output<<'</li>'
    end

    if current_user.allowed_to?(:create_clearances)
      output<< '<li>'
      output<< link_to('New clearance', new_employee_clearance_path(user))
      output<<'</li>'
    end

    if current_user.allowed_to?(:create_certifications)
      output<< '<li>'
      output<< link_to('New certification', new_employee_certification_path(user))
      output<<'</li>'
    end

    if current_user.allowed_to?(:create_languages)
      output<< '<li>'
      output<< link_to('New language', new_employee_language_path(user))
      output<<'</li>'
    end

    if current_user.allowed_to?(:create_other_skills)
      output<< '<li>'
      output<< link_to('New Skill', new_employee_other_skill_path(user))
      output<<'</li>'
    end

    if current_user.allowed_to?(:create_documents)
      output<< '<li>'
      output<< link_to('New Document', new_employee_document_path(user))
      output<<'</li>'
    end

    if current_user.allowed_to?(:create_positions)
      output<< '<li>'
      output<< link_to('New position', new_employee_position_path(user))
      output<<'</li>'
    end

   if current_user.allowed_to?(:create_affiliations)
      output<< '<li>'
      output<< link_to('New affiliation', new_employee_affiliation_path(user))
      output<<'</li>'
    end
    output<< '</ul></div>'

    output.html_safe
  end
end
