class Case < ApplicationRecord
  belongs_to :assigned_to, class_name: 'User', optional: true
  belongs_to :priority_type, optional: true, foreign_key: :priority_id
  belongs_to :case_type, optional: true

  validates_presence_of :title

  def priority_type
    if priority_id
      super
    else
      PriorityType.default
    end
  end

  def user; assigned_to; end

  def task_status_type
    if task_status_type_id
      super
    else
      CaseType.default
    end
  end

  def to_s
    title
  end



  def self.safe_attributes
    [
        :title, :case_type_id, :assigned_to_id, :priority_id,
        :date_start, :date_due, :date_completed
    ]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Case ##{id}", :style => :bold}

    pdf.text "<b>Case type: </b> #{certification_type}", :inline_format =>  true
    pdf.text "<b>Date received: </b> #{date_received}", :inline_format =>  true
    pdf.text "<b>Date expired: </b> #{date_expired}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end

end
