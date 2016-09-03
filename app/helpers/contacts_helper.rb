module ContactsHelper
  def link_new_contact
    if User.current  == current_user
      new_contact_path
    else
      new_employee_contact_path
    end
  end

end
