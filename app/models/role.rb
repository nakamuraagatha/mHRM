class Role < ApplicationRecord
  belongs_to :role_type
  has_many :job_details

  scope :active, lambda { where(:state => true) }

  def setable_permissions
    setable_permissions = Redmine::AccessControl.permissions - Redmine::AccessControl.public_permissions
    setable_permissions
  end

end
