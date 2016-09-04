class Certification < ApplicationRecord
  belongs_to :certification_type
  belongs_to :user
  mount_uploader :file, AttachmentUploader

  def self.safe_attributes
    [:certification_type_id,:file, :user_id, :date_received, :note, :date_expired]
  end
end
