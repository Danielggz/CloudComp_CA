json.extract! employee, :id, :empNumber, :code, :name, :lastname, :position, :created_at, :updated_at
json.url employee_url(employee, format: :json)
