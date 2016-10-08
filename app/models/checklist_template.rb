class ChecklistTemplate < ApplicationRecord
  belongs_to :user
  has_many :checklists, dependent: :destroy
  has_many :checklist_users, dependent: :destroy
  accepts_nested_attributes_for :checklists, reject_if: :all_blank, allow_destroy: true

  has_many :checklist_answers, dependent: :destroy

  belongs_to :case, optional: true, foreign_key: :related_to_id

  scope :not_related, -> {where(related_to_id: nil)}


  validates_presence_of :title

  CHECKLIST_TYPE = ['', 'Task']

  def checklist_notes
    ChecklistNote.where(owner_id: self.id)
  end

  def notes(user_id)
    checklist_notes.where(user_id: user_id)
  end

  def self.safe_attributes
    [:title, :description, :user_id, :related_to_id, :related_to_type, :checklist_type, checklists_attributes: [Checklist.safe_attributes]]
  end

  def to_s
    title
  end

 def self.safe_attributes_with_save
    [checklist_answers_attributes: [ChecklistAnswer.safe_attributes]]
 end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Checklist ##{id}", :style => :bold}
    User.current.to_pdf_brief_info(pdf)
    pdf.text "<b>Title: </b> #{title}", :inline_format =>  true
    pdf.text "<b>Type: </b> #{checklist_type}", :inline_format =>  true
    pdf.text "<b>Description: </b> #{ActionView::Base.full_sanitizer.sanitize(description)}", :inline_format =>  true
    self.checklists.each_with_index do |checklist, index|
      checklist_answer = ChecklistAnswer.where(checklist_id: checklist.id, user_id: User.current.id).first_or_initialize
      pdf.text "<b>[ #{checklist_answer.status ? 'X' : ' ' } ]</b> #{checklist.description}    #{checklist_answer.due_date}", :inline_format =>  true
    end
  end
end
