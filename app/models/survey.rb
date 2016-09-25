class Survey < ApplicationRecord
  has_many :survey_answers, dependent: :destroy

  belongs_to :survey_type
  belongs_to :assigned_to, class_name: 'User'

  after_save :send_notification

  def send_notification
    UserMailer.survey_notification(self).deliver_now
  end

  def self.safe_attributes
    [:id, :question, :survey_type_id, :assigned_to_id, :user_id, :due_date, :date_completed]
  end

  def survey_type
    if survey_type_id
      super
    else
      SurveyType.default
    end
  end

  def for_mail
    output = ""
    output<< "<h2>Survey ##{id} </h2>"
    output<< "<b>Survey type: </b> #{survey_type}<br/>"
    output<< "<b>Assigned_to: </b> #{assigned_to}<br/>"
    output<< "<b>due date: </b> #{due_date}<br/>"
    output<< "<b>Question: </b> #{question.html_safe}<br/>"

    output.html_safe
  end

end
