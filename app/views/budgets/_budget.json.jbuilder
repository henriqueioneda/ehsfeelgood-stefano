json.extract! budget, :id, :requested_service, :hirer_id, :hirer_name, :supplier_id, :supplier_name, :budget_status, :budget_price, :created_at, :updated_at
json.url budget_url(budget, format: :json)
