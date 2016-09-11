class Document < ApplicationRecord
  belongs_to :document_type
  belongs_to :user

  validates_presence_of :title

  has_many :document_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :document_attachments, reject_if: :all_blank, allow_destroy: true


  def visible?
    User.current == user or User.current.allowed_to?(:edit_documents) or User.current.allowed_to?(:manage_documents)
  end

  def self.safe_attributes
    [:title, :description, :user_id, :document_type_id, :date, document_attachments_attributes: [Attachment.safe_attributes]]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Document ##{id}", :style => :bold}
    user.to_pdf_brief_info(pdf)
    pdf.text "<b>Title: </b> #{title}", :inline_format =>  true
    pdf.text "<b>Desciption: </b> #{ActionView::Base.full_sanitizer.sanitize(description)}", :inline_format =>  true
    pdf.text "<b>Document type: </b> #{document_type}", :inline_format =>  true
  end

end
