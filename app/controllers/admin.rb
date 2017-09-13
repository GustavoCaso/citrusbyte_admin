get '/admin/list' do
  erb :'admin/list'
end

get '/admin/controls' do
  controls = Control.all
  erb :'admin/controls', locals: { controls: controls }
end
