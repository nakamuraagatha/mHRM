class Department < ApplicationRecord
  belongs_to :department_type
  has_one :department_extend_demography

  validates_presence_of :department_type_id

  def self.visible(current_user)
    where user_id: current_user.id
  end

  def department_informations
    department_extend_demography || DepartmentExtendDemography.new(department_id: self.id)
  end


end
