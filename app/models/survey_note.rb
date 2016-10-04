class SurveyNote < Note
  belongs_to :survey, foreign_key: :owner_id, class_name: 'Survey::Survey'

  def object
    survey
  end
end