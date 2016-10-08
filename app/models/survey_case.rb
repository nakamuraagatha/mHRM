class SurveyCase < ApplicationRecord
  belongs_to :case, foreign_key: :assigned_to_id
  belongs_to :survey, class_name: 'Survey::Survey'
end
