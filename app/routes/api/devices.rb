get '/api/v1/devices' do
  content_type :json

  Device.all.map do |device|
    DevicePresenter.call(device)
  end.to_json
end

get '/api/v1/devices/:id' do
  content_type :json

  DevicePresenter.call(Device[params['id']]).to_json
end

put '/api/v1/devices/:id' do
  content_type :json

  device = Device[params['id']]
  client_data = JSON.parse(request.body.read.to_s)
  updated_data = Api::UpdateControlData.call(device.data, client_data)
  device[:data] = updated_data
  device.save
  DevicePresenter.call(device).to_json
end
