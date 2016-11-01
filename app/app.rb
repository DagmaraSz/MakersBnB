
ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require_relative 'models/space'


class MakersBnb < Sinatra::Base

  get '/' do
    erb :'home'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'index'
  end

  get '/spaces/new' do
    erb :'space/space_new'
  end

  post '/spaces' do
  space = Space.create(name: params[:name], address: params[:address], postcode: params[:postcode], price: params[:price])
  space.save
  redirect '/spaces'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
