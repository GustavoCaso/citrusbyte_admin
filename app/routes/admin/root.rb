get '/admin' do
  devices = Device.all
  erb :'admin/root', locals: { devices: devices }
end
