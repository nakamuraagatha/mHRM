class Document < ApplicationRecord
  belongs_to :document_type
  belongs_to :user

  validates_presence_of :title

  mount_uploader :attachment, AttachmentUploader

  scope :visible, lambda {|action|  User.current.allowed_to?(action) ? where(nil) :  where(user_id: User.current.id) }

  def visible?
    User.current == user or User.current.allowed_to?(:edit_documents) or User.current.allowed_to?(:manage_documents)
  end

end
