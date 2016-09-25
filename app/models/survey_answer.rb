class SurveyAnswer < ApplicationRecord
  belongs_to :survey
  belongs_to :user

  def self.safe_attributes
    [:id, :answer, :survey_id, :user_id, :_destroy]
  end

end
