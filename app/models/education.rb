class Education < ApplicationRecord
  belongs_to :user
  belongs_to :education_type
  has_many :education_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :education_attachments, reject_if: :all_blank, allow_destroy: true

  after_save :send_notification
  def send_notification
    UserMailer.education_notification(self).deliver_now
  end

  def visible?
    User.current == user or User.current.allowed_to?(:edit_educations) or User.current.allowed_to?(:manage_educations)
  end

  def education_type
    if education_type_id
      super
    else
      EducationType.default
    end
  end

  def self.safe_attributes
    [:user_id, :education_type_id, :date_recieved,
     :date_expired, :note,
     education_attachments_attributes: [Attachment.safe_attributes]]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Education ##{id}", :style => :bold}
    user.to_pdf_brief_info(pdf)
    pdf.text "<b>Education type: </b> #{education_type}", :inline_format =>  true
    pdf.text "<b>Date received: </b> #{date_recieved}", :inline_format =>  true
    pdf.text "<b>Date expired: </b> #{date_expired}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end

  def for_mail
    output = ""
    output<< "<h2>Education ##{id} </h2>"
    output<<"<b>Education type: </b> #{education_type}<br/>"
    output<<"<b>Date received: </b> #{date_recieved}<br/>"
    output<<"<b>Date expired: </b> #{date_expired}<br/>"
    output<<"<b>Note: </b> #{note}<br/>"

    output.html_safe
  end

end
