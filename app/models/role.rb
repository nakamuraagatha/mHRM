class Role < ApplicationRecord
  belongs_to :role_type

  def setable_permissions
    setable_permissions = Redmine::AccessControl.permissions - Redmine::AccessControl.public_permissions
    setable_permissions
  end
end
