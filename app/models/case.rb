class Case < ApplicationRecord
  belongs_to :assigned_to, class_name: 'User', optional: true
  belongs_to :priority_type, optional: true, foreign_key: :priority_id
  belongs_to :case_type, optional: true
  belongs_to :case_category, optional: true, foreign_key: :case_category_type_id
  belongs_to :case_status_type, optional: true

  has_many :sub_cases, foreign_key: :subcase_id, class_name: 'Case'
  has_many :relations, foreign_key: :case_id, class_name: 'CaseRelation'


  has_many :tasks, foreign_key: :related_to_id, class_name: 'Task'
  has_many :surveys, foreign_key: :related_to_id, class_name: 'Survey::Survey'
  has_many :documents, foreign_key: :related_to_id, class_name: 'Document'
  has_many :checklists, foreign_key: :assigned_to_id, class_name: 'ChecklistCase'

  has_many :case_notes, foreign_key: :owner_id

  scope :root, -> {where(subcase_id: nil)}

  validates_presence_of :title

  def priority_type
    if priority_id
      super
    else
      PriorityType.default
    end
  end

 def case_category_type
    if case_category_id
      super
    else
      PriorityType.default
    end
  end

  before_destroy do
    sub_cases.update_all(subcase_id: nil)
  end

  def user; assigned_to; end

  def case_status_type
    if case_status_type_id
      super
    else
      CaseStatusType.default
    end
  end

  def case_type
    if case_type_id
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
        :title, :description, :case_type_id, :assigned_to_id, :priority_id, :subcase_id,
        :date_start, :date_due, :date_completed, :case_status_id, :note, :case_category_type_id
    ]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Case ##{id}", :style => :bold}

    pdf.text "<b>Title: </b> #{title}", :inline_format =>  true
    pdf.text "<b>Description: </b> #{ActionView::Base.full_sanitizer.sanitize(description)}", :inline_format =>  true
    pdf.text "<b>Case type: </b> #{case_type}", :inline_format =>  true
    pdf.text "<b>Case status: </b> #{case_status_type}", :inline_format =>  true
    pdf.text "<b>Case category: </b> #{case_category_type}", :inline_format =>  true
    pdf.text "<b>Priority: </b> #{priority_type}", :inline_format =>  true

    pdf.text "<b>Date start: </b> #{date_start}", :inline_format =>  true
    pdf.text "<b>Date due: </b> #{date_due}", :inline_format =>  true
    pdf.text "<b>Date completed: </b> #{date_completed}", :inline_format =>  true

    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end

end
