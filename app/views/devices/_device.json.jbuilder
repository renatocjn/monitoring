json.extract! device, :id, :name, :hostname, :description, :created_at, :updated_at
json.url device_url(device, format: :json)
