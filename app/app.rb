
ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require_relative 'models/space'


class MakersBnb < Sinatra::Base
  get '/' do
    'Hello MakersBnb!'
  end

  get '/space/new' do
    erb :'space/space_new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
