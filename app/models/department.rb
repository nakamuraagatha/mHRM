class Department < ApplicationRecord
  belongs_to :department_type
  has_one :department_extend_demography
  has_many :job_details

  validates_presence_of :department_type_id
  validates_uniqueness_of :department_type_id

  def self.visible(current_user)
    return where(nil) if current_user.admin?
    where user_id: current_user.id
  end

  def department_informations
    department_extend_demography || DepartmentExtendDemography.new(department_id: self.id)
  end

end
