ActiveModelSerializers.config.tap do |c|
  c.adapter = :json_api
  c.key_transform = :camel_lower
end
