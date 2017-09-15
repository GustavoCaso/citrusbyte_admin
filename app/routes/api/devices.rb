get '/api/v1/devices' do
  Device.all.to_json
end
