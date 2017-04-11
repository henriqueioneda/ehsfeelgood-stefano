json.extract! service, :id, :service_type, :hirer_id, :hirer_name, :supplier_id, :supplier_name, :service_status, :service_price, :created_at, :updated_at
json.url service_url(service, format: :json)
