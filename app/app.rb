
ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require_relative 'models/space'


class MakersBnb < Sinatra::Base
  get '/' do
    @spaces = Space.all
    erb :index
  end

  get '/space/new' do
    erb :'space/space_new'
  end

  post '/' do
  space = Space.create(name: params[:name], address: params[:address], postcode: params[:postcode], price: params[:price])
  space.save
  redirect '/'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
