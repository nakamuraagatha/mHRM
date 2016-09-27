class Journal < ApplicationRecord
  has_many :journal_answers, dependent: :destroy

  belongs_to :journal_type
  belongs_to :assigned_to, class_name: 'User'

  after_save :send_notification

  def send_notification
    UserMailer.journal_notification(self).deliver_now
  end

  def self.safe_attributes
    [:id, :question, :journal_type_id, :assigned_to_id, :user_id, :due_date, :date_completed]
  end

  def journal_type
    if self.journal_type_id
      super
    else
      JournalType.default
    end
  end

  def for_mail
    output = ""
    output<< "<h2>journal ##{id} </h2>"
    output<< "<b>journal type: </b> #{journal_type}<br/>"
    output<< "<b>Assigned_to: </b> #{assigned_to}<br/>"
    output<< "<b>due date: </b> #{due_date}<br/>"
    output<< "<b>Question: </b> #{question.html_safe}<br/>"

    output.html_safe
  end

end
