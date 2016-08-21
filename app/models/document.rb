class Document < ApplicationRecord
  belongs_to :document_type

  validates_presence_of :title

  mount_uploader :attachment, AttachmentUploader
end
