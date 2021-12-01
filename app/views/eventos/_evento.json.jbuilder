json.extract! evento, :id, :nombre, :fecha_inicial, :fecha_final, :created_at, :updated_at
json.url evento_url(evento, format: :json)
