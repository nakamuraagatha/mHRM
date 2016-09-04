class Education < ApplicationRecord
  belongs_to :user
  belongs_to :education_type
  mount_uploader :file, AttachmentUploader

  validates_presence_of :education_type_id, :user_id

  def visible?
    User.current == user or User.current.allowed_to?(:edit_educations) or User.current.allowed_to?(:manage_educations)
  end

  def self.safe_attributes
    [:user_id, :file, :education_type_id, :date_recieved, :date_expired, :note]
  end

end
