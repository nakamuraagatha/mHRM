class Case < ApplicationRecord
  belongs_to :assigned_to, class_name: 'User', optional: true
  belongs_to :priority_type, optional: true, foreign_key: :priority_id
  belongs_to :case_type, optional: true

  has_many :sub_cases, foreign_key: :subcase_id, class_name: 'Case'

  validates_presence_of :title

  def priority_type
    if priority_id
      super
    else
      PriorityType.default
    end
  end

  before_destroy do
    sub_cases.update_all(subcase_id: nil)
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
        :title, :case_type_id, :assigned_to_id, :priority_id, :subcase_id,
        :date_start, :date_due, :date_completed
    ]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Case ##{id}", :style => :bold}

    pdf.text "<b>Title: </b> #{title}", :inline_format =>  true
    pdf.text "<b>Case type: </b> #{case_type}", :inline_format =>  true
    pdf.text "<b>Priority: </b> #{priority_type}", :inline_format =>  true

    pdf.text "<b>Date start: </b> #{date_start}", :inline_format =>  true
    pdf.text "<b>Date due: </b> #{date_due}", :inline_format =>  true
    pdf.text "<b>Date completed: </b> #{date_completed}", :inline_format =>  true
  end

end
