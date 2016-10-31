
ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'app/models/data_mapper_setup'

class MakersBnb < Sinatra::Base
  get '/' do
    'Hello MakersBnb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
