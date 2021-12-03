json.extract! evento, :id, :name, :start_time, :end_time, :user_id, :created_at, :updated_at
json.url evento_url(evento, format: :json)
