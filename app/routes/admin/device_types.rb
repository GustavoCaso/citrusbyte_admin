get '/admin/device_types' do
  device_types = DeviceType.all
  erb :'admin/device_types/index', locals: { device_types: device_types }
end

get '/admin/device_types/new' do
  erb :'admin/device_types/new'
end

get '/admin/device_types/:id' do
  device_type = DeviceType[params['id']]
  erb :'admin/device_types/show', locals: { device_type: device_type }
end

get '/admin/device_types/:id/edit' do
  device_type = DeviceType[params['id']]
  erb :'admin/device_types/edit', locals: { device_type: device_type }
end

post '/admin/device_types' do
  DeviceType.create(params['device_type'])
  redirect '/admin/device_types'
end

put '/admin/device_types/:id' do
  DeviceType[params['id']].update(params['device_type'])
  redirect "/admin/device_types/#{params['id']}"
end

get '/admin/device_types/:id/delete' do
  DeviceType[params['id']].delete
  redirect '/admin/device_types'
end
