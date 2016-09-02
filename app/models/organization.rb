class Organization < ApplicationRecord
  has_many :users
  belongs_to :address
  belongs_to :user


  has_many :emails, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true
  has_many :faxes, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :faxes, reject_if: :all_blank, allow_destroy: true
  has_many :addresses, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true


  def visible?
    User.current == user or User.current.allowed_to?(:edit_organizations) or User.current.allowed_to?(:manage_organizations)
  end

  def self.safe_attributes
    [:name, :organization_type_id, :note,
     emails_attributes: [Email.safe_attributes],
     addresses_attributes: [Address.safe_attributes],
     faxes_attributes:   [Fax.safe_attributes]
    ]
  end

end
