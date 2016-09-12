class Department < ApplicationRecord
  belongs_to :user
  belongs_to :department_type
  belongs_to :organization, optional: true


  has_one :department_extend_demography
  has_many :job_details

  has_many :department_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :department_attachments, reject_if: :all_blank, allow_destroy: true

  def department_type
    if department_type_id
      super
    else
      DepartmentType.default
    end
  end

  before_destroy :check_integrity

  validates_presence_of :department_type_id
  validates_uniqueness_of :department_type_id

  scope :visible, lambda {|action|  User.current.allowed_to?(action) ? for_employees :  where(user_id: User.current.id) }
  scope :for_employees, -> {where(user_id: User.employees.pluck(:id))}

  def self.safe_attributes
    [:user_id, :note, :date_start, :date_end, :department_type_id,
     :organization_id, department_attachments_attributes: [Attachment.safe_attributes]]
  end

  def visible?
    User.current == user or User.current.allowed_to?(:edit_departments) or User.current.allowed_to?(:manage_departments)
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

  def to_s
    "#{department_type}"
  end

  def name
    "#{id} #{department_type}"
  end

  def grouped_by_role
    job_details.group_by{|j| j.role.to_s }
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Department ##{id}", :style => :bold}
    pdf.text "<b>Department type: </b> #{department_type}", :inline_format =>  true
    pdf.text "<b>Organization: </b> #{organization}", :inline_format =>  true
    pdf.text "<b>Date received: </b> #{date_start}", :inline_format =>  true
    pdf.text "<b>Date expired: </b> #{date_end}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end

end
