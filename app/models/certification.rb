class Certification < ApplicationRecord
  belongs_to :certification_type
  belongs_to :user

  has_many :certification_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :certification_attachments, reject_if: :all_blank, allow_destroy: true

  def certification_type
    if certification_type_id
      super
    else
      CertificationType.default
    end
  end

  def self.safe_attributes
    [:certification_type_id, :user_id, :date_received, :note, :date_expired,
     certification_attachments_attributes: [Attachment.safe_attributes]]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Certification ##{id}", :style => :bold}
    user.to_pdf_brief_info(pdf)
    pdf.text "<b>Certification type: </b> #{certification_type}", :inline_format =>  true
    pdf.text "<b>Date received: </b> #{date_received}", :inline_format =>  true
    pdf.text "<b>Date expired: </b> #{date_expired}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end
end
