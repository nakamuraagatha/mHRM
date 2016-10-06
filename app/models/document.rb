class Document < ApplicationRecord
  belongs_to :document_type
  belongs_to :user

  validates_presence_of :title

  scope :not_related, -> {where(related_to_id: nil)}

  has_many :document_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :document_attachments, reject_if: :all_blank, allow_destroy: true

  after_save :send_notification
  def send_notification
    UserMailer.document_notification(self).deliver_now
  end

  def document_type
    if document_type_id
      super
    else
      DocumentType.default
    end
  end

  def visible?
    User.current == user or User.current.allowed_to?(:edit_documents) or User.current.allowed_to?(:manage_documents)
  end

  def self.safe_attributes
    [:title, :description, :related_to_id, :related_to_type, :user_id, :document_type_id, :date, document_attachments_attributes: [Attachment.safe_attributes]]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Document ##{id}", :style => :bold}
    user.to_pdf_brief_info(pdf)
    pdf.text "<b>Title: </b> #{title}", :inline_format =>  true
    pdf.text "<b>Description: </b> #{ActionView::Base.full_sanitizer.sanitize(description)}", :inline_format =>  true
    pdf.text "<b>Document type: </b> #{document_type}", :inline_format =>  true
  end

  def for_mail
    output = ""
    output<< "<h2>Document ##{id} </h2>"
    output<< "<b>Title: </b> #{title}<br/>"
    output<< "<b>Description: </b> #{description}<br/>"
    output<< "<b>Document type: </b> #{document_type}<br/>"
    output.html_safe
  end

end
