json.extract! c, :id, :title, :priority_id, :case_type_id, :date_start, :date_due, :date_complete, :assigned_to_id, :created_at, :updated_at
json.url case_url(c, format: :json)