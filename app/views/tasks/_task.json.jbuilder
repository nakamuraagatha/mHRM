json.extract! task, :id, :title, :description, :task_type_id, :priority_id, :date_start, :date_due, :user_id, :date_completed, :created_at, :updated_at
json.url task_url(task, format: :json)