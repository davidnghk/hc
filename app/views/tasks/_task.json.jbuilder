json.extract! task, :id, :type, :code, :name, :chi_name, :created_at, :updated_at
json.url task_url(task, format: :json)
