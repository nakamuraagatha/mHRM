class Contact < ApplicationRecord
  belongs_to :contact_type
  belongs_to :user
  has_one :contact_extend_demography

  def self.safe_attributes
    [:emergency_contact, :first_name, :middle_name, :last_name,
     :note, :contact_type_id, :user_id, :file]
  end

  def extend_informations
    contact_extend_demography || ContactExtendDemography.new(contact_id: self.id)
  end

  def name
    "#{first_name} #{middle_name} #{last_name}".gsub('  ', ' ')
  end

  mount_uploader :file, AttachmentUploader
end
