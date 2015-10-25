class App < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    serve '/vendor', from: 'vendor'

    js :vendor, [
      '/vendor/js/*'
    ]

    js :application, [
      '/js/**/*'
    ]

    css :application, [
      '/css/bootstrap.min.css'
    ]
  end

  get '/' do
    haml :index
  end
end
