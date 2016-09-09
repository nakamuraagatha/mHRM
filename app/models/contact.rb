class Contact < ApplicationRecord
  belongs_to :contact_type
  belongs_to :user
  has_one :contact_extend_demography

  has_many :contact_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :contact_attachments, reject_if: :all_blank, allow_destroy: true


  def self.safe_attributes
    [:emergency_contact, :first_name, :middle_name, :last_name,
     :note, :contact_type_id, :user_id, contact_attachments_attributes: [Attachment.safe_attributes]]
  end

  def extend_informations
    contact_extend_demography || ContactExtendDemography.new(contact_id: self.id)
  end

  def name
    "#{first_name} #{middle_name} #{last_name}".gsub('  ', ' ')
  end

end
