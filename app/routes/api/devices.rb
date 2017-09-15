get '/api/v1/devices' do
  Device.all.to_json
end

put '/api/v1/devices/:id' do
  device = Device[params['id']]
  client_data = JSON.parse(request.body.read.to_s)
  updated_data = Api::UpdateControlData.call(device.data, client_data)
  device[:data] = updated_data
  device.save
  device.to_json
end
