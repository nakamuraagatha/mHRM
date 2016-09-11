class Education < ApplicationRecord
  belongs_to :user
  belongs_to :education_type
  has_many :education_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :education_attachments, reject_if: :all_blank, allow_destroy: true


  validates_presence_of :education_type_id, :user_id

  def visible?
    User.current == user or User.current.allowed_to?(:edit_educations) or User.current.allowed_to?(:manage_educations)
  end

  def self.safe_attributes
    [:user_id, :education_type_id, :date_recieved,
     :date_expired, :note,
     education_attachments_attributes: [Attachment.safe_attributes]]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Education ##{id}", :style => :bold}
    pdf.text "<b>Education type: </b> #{education_type}", :inline_format =>  true
    pdf.text "<b>Date received: </b> #{date_recieved}", :inline_format =>  true
    pdf.text "<b>Date expired: </b> #{date_expired}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end

end
