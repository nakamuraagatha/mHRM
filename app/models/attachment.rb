class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  def self.safe_attributes
    [:id, :file, :type, :description, :owner_id, :_destroy]
  end
end
