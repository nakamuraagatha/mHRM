class Organization < ApplicationRecord
  has_many :users
  belongs_to :user
  belongs_to :organization_type
  has_one :organization_extend_demography, :dependent => :destroy

  def visible?
    User.current == user or User.current.allowed_to?(:edit_organizations) or User.current.allowed_to?(:manage_organizations)
  end

  def to_s
    name
  end

  def self.safe_attributes
    [:name, :organization_type_id, :note, :user_id ]
  end

  def extend_informations
    organization_extend_demography || OrganizationExtendDemography.new(organization_id: self.id)
  end


  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Organization ##{id}", :style => :bold}
    pdf.text "<b>Organization type </b> #{organization_type}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end

end
