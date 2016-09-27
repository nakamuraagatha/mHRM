json.extract! survey, :id, :survey_type_id, :question, :user_id, :addigned_to_id, :due_date, :date_completed, :created_at, :updated_at
json.url survey_url(survey, format: :json)