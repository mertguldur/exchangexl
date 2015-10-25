class App < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    js :application, [
      '/js/*.js',
    ]

    css :application, [
      '/css/bootstrap.min.css'
    ]
  end

  get '/' do
    haml :index
  end
end
