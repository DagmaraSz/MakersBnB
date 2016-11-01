
ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'carrierwave/datamapper'
require 'carrierwave'
require_relative 'app/models/data_mapper_setup'
require_relative 'app/models/space'
require_relative 'app/models/image'

class MakersBnb < Sinatra::Base
  get '/' do
    'Hello MakersBnb!'
  end

  get '/image' do
    @images = Image.all
    erb :'image'
  end

  post '/image' do
    image = Image.new
    image.file = params[:image]
    image.save
    redirect('/image')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
