class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assigned_to, class_name: 'User', optional: true
  belongs_to :for_individual, class_name: 'User', optional: true
  belongs_to :priority_type, optional: true, foreign_key: :priority_id
  belongs_to :task_type, optional: true
  belongs_to :task_status_type, optional: true

  has_many :task_notes, dependent: :destroy


  has_many :task_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :task_attachments, reject_if: :all_blank, allow_destroy: true


  after_save :send_notification


  def send_notification
    UserMailer.task_notification(self).deliver_now
  end

  def priority_type
    if priority_id
      super
    else
      PriorityType.default
    end
  end

 def task_status_type
    if task_status_type_id
      super
    else
      TaskStatusType.default
    end
  end

  def to_s
    task_type
  end

  def task_type
    if task_type_id
      super
    else
      TaskType.default
    end
  end

  def visible?
    User.current.permitted_users.include? user
  end

  def can?(*args)
    owner? or args.map{|action| User.current.allowed_to?(action) }.include?(true) or assigned_to == User.current or for_individual == User.current
  end

  def self.safe_attributes
    [:title, :description, :task_type_id, :task_status_type_id, :priority_id, :assigned_to_id, :for_individual_id,
     :date_start, :date_due, :user_id, :date_completed,
     task_attachments_attributes: [Attachment.safe_attributes]]
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Task ##{id}", :style => :bold}
    user.to_pdf_brief_info(pdf)
    pdf.text "<b>Title: </b> #{title}", :inline_format =>  true
    pdf.text "<b>Description: </b> #{ActionView::Base.full_sanitizer.sanitize(description)}", :inline_format =>  true
    pdf.text "<b>Task type: </b> #{task_type}", :inline_format =>  true
    pdf.text "<b>Status: </b> #{task_status_type}", :inline_format =>  true
    pdf.text "<b>Assigned to: </b> #{assigned_to}", :inline_format =>  true
    pdf.text "<b>For individual: </b> #{for_individual}", :inline_format =>  true
    pdf.text "<b>Priority: </b> #{priority_type}", :inline_format =>  true

    pdf.text "<b>Date start: </b> #{date_start}", :inline_format =>  true
    pdf.text "<b>Date due: </b> #{date_due}", :inline_format =>  true
    pdf.text "<b>Date completed: </b> #{date_completed}", :inline_format =>  true
    if User.current.allowed_to?(:manage_roles) or User.current.allowed_to?(:view_notes)

    end
  end

  def for_mail
    output = ""
    output<< "<h2>Task ##{id} </h2>"
    output<<"<b>Title: </b> #{title}"
    output<<"<b>Description: </b> #{description} <br/>"
    output<<"<b>Task type: </b> #{task_type}<br/>"
    output<<"<b>Status: </b> #{task_status_type}<br/>"
    output<<"<b>Priority: </b> #{priority_type}<br/>"

    output<<"<b>Date start: </b> #{date_start}<br/>"
    output<<"<b>Date due: </b> #{date_due}<br/>"
    output<<"<b>Date completed: </b> #{date_completed}<br/>"
    output.html_safe
  end
end
