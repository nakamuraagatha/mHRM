class Clearance < ApplicationRecord
  belongs_to :clearence_type
  belongs_to :user
  mount_uploader :file, AttachmentUploader

  def self.safe_attributes
    [:clearence_type_id, :user_id, :file, :date_received, :note, :date_expired]
  end
end
