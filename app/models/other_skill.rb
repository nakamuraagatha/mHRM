class OtherSkill < ApplicationRecord
  belongs_to :user
  
  mount_uploader :file, AttachmentUploader


  validates_presence_of :name

  def visible?
    User.current == user or User.current.allowed_to?(:edit_other_skills) or User.current.allowed_to?(:manage_other_skills)
  end

  def self.safe_attributes
    [:user_id, :name, :date_received, :date_expired, :note, :file]
  end
end
