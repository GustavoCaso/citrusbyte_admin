get '/admin/devices/new' do
  erb :'admin/devices/new'
end

get '/admin/devices/:id' do
  device = Device[params['id']]
  erb :'admin/devices/show', locals: { device: device }
end

get '/admin/devices/:id/edit' do
  device = Device[params['id']]
  erb :'admin/devices/edit', locals: { device: device }
end

post '/admin/devices' do
  device_params = DeviceParameterBuilder.call(params['device'])
  Device.create(device_params)
  redirect '/admin'
end

put '/admin/devices/:id' do
  device = Device[params['id']]
  device_params = DeviceParameterBuilder.call(params['device'])
  device.update(device_params)
  redirect "/admin/devices/#{device.id}"
end

get '/admin/devices/:id/delete' do
  Device[params['id']].delete
  redirect '/admin'
end
