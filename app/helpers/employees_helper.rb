module EmployeesHelper
  def render_action_link(user)
    output = '<div class="btn-group">
<button aria-expanded="true" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
												Action <span class="caret"></span>
											</button>
<ul class="dropdown-menu">'
    if User.current.allowed_to?(:create_contacts)
      output<< '<li>'
      output<< link_to('New contact', new_employee_contact_path(user))
      output<<'</li>'
    end

    if User.current.allowed_to?(:create_departments)
      output<< '<li>'
      output<< link_to('New department', new_employee_department_path(user))
      output<<'</li>'
    end
    if User.current.allowed_to?(:create_documents)
      output<< '<li>'
      output<< link_to('New Document', new_employee_document_path(user))
      output<<'</li>'
    end
    if User.current.allowed_to?(:create_organizations)
      output<< '<li>'
      output<< link_to('New organization', new_employee_organization_path(user))
      output<<'</li>'
    end
    if User.current.allowed_to?(:create_positions)
      output<< '<li>'
      output<< link_to('New position', new_employee_position_path(user))
      output<<'</li>'
    end
    output<< '</ul></div>'

    output.html_safe
  end
end
