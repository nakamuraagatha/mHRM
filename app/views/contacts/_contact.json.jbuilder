json.extract! contact, :id, :emergency_contact, :note, :created_at, :updated_at
json.url contact_url(contact, format: :json)