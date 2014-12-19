json.array!(@organizacions) do |organizacion|
  json.extract! organizacion, :id, :nombre, :subdominio, :estatus
  json.url organizacion_url(organizacion, format: :json)
end
