json.extract! document, :id, :title, :description, :user_id, :document_type_id, :date, :attachment, :created_at, :updated_at
json.url document_url(document, format: :json)