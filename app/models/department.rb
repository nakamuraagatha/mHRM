class Department < ApplicationRecord
  belongs_to :department_type
  has_one :department_extend_demography
  has_many :job_details

  before_destroy :check_integrity

  validates_presence_of :department_type_id
  validates_uniqueness_of :department_type_id

  def self.visible
    where(user_id: User.current.permitted_users)
  end

  def visible?
    User.current.permitted_users.include? user
  end

  def department_informations
    department_extend_demography || DepartmentExtendDemography.new(department_id: self.id)
  end

  def in_use?
    job_details.present?
  end

  alias :destroy_without_reassign :destroy
  # Destroy the enumeration
  # If a department is specified, objects are reassigned
  def destroy(reassign_to = nil)
    if reassign_to && reassign_to.is_a?(Department)
      self.transfer_relations(reassign_to)
    end
    destroy_without_reassign
  end

  def objects
    JobDetail.where(:department_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:department_id => to.id)
  end

  def check_integrity
    raise "Cannot delete enumeration" if self.in_use?
  end

  def users
    job_details.map{|job| job.user}
  end

  def name
    "#{id} #{department_type}"
  end

end
