class Document < ApplicationRecord
  belongs_to :document_type
  belongs_to :user

  validates_presence_of :title

  mount_uploader :attachment, AttachmentUploader

  def self.visible
    where(user_id: User.current.permitted_users)
  end

  def visible?
    User.current.permitted_users.include? user
  end

end
