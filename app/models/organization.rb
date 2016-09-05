class Organization < ApplicationRecord
  has_many :users
  belongs_to :user
  belongs_to :organization_type
  has_one :organization_extend_demography, :dependent => :destroy

  def visible?
    User.current == user or User.current.allowed_to?(:edit_organizations) or User.current.allowed_to?(:manage_organizations)
  end

  def to_s
    organization_type
  end

  def self.safe_attributes
    [:name, :organization_type_id, :note, :user_id ]
  end

  def extend_informations
    organization_extend_demography || OrganizationExtendDemography.new(organization_id: self.id)
  end

end
