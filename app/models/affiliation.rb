class Affiliation < ApplicationRecord
  has_many :users
  belongs_to :user
  belongs_to :affiliation_type
  has_one :affiliation_extend_demography, :dependent => :destroy

  def visible?
    User.current == user or User.current.allowed_to?(:edit_affiliations) or User.current.allowed_to?(:manage_affiliations)
  end

  def to_s
    name
  end

  def self.safe_attributes
    [:name, :affiliation_type_id, :note, :user_id ]
  end

  def extend_informations
    affiliation_extend_demography || AffiliationExtendDemography.new(affiliation_id: self.id)
  end

end
