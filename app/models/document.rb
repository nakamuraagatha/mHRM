class Document < ApplicationRecord
  belongs_to :document_type

  mount_uploader :attachment, AttachmentUploader
end
