json.extract! incident, :id, :type, :task, :incident_datetime, :request_datetime, :location_id, :user_id, :ref, :status, :source, :responsible_user_id, :worker_user_id, :heading, :details, :created_at, :updated_at
json.url incident_url(incident, format: :json)
