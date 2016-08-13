json.extract! address, :id, :address_type, :address, :city, :zip_code, :state, :country_code, :created_at, :updated_at
json.url address_url(address, format: :json)