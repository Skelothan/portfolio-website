json.extract! uploaded_file, :id, :name, :url, :media_type, :upload_date, :active, :created_at, :updated_at
json.url uploaded_file_url(uploaded_file, format: :json)
