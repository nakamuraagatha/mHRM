class Position < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :pay_rate, optional: true
  belongs_to :employment_type, optional: true
  belongs_to :location_type, optional: true


  has_many :position_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :position_attachments, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :department_id, :user_id

  def visible?
    User.current.permitted_users.include? user
  end

  def self.safe_attributes
    [:user_id, :title, :position_description,
     :location_type_id, :special_requirement, :note,
     :date_start, :date_end, :department_id, :salary, :pay_rate, :employment_type_id,
     position_attachments_attributes: [Attachment.safe_attributes]]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Position ##{id}", :style => :bold}
    user.to_pdf_brief_info(pdf)
    pdf.text "<b>title: </b> #{title}", :inline_format =>  true
    pdf.text "<b>Position description: </b> #{ActionView::Base.full_sanitizer.sanitize(position_description)}", :inline_format =>  true
    pdf.text "<b>Location: </b> #{location_type}", :inline_format =>  true
    pdf.text "<b>Special requirement: </b> #{special_requirement}", :inline_format =>  true
    pdf.text "<b>Date start: </b> #{date_start}", :inline_format =>  true
    pdf.text "<b>Date end: </b> #{date_end}", :inline_format =>  true
    pdf.text "<b>Pay: </b> #{salary}", :inline_format =>  true
    pdf.text "<b>Pay rate: </b> #{pay_rate}", :inline_format =>  true
    pdf.text "<b>Employment type: </b> #{employment_type}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end

end
