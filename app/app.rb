
ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require_relative 'models/space'


class MakersBnb < Sinatra::Base

  enable :sessions


  get '/' do
    erb :'home'
  end

  before '/spaces' do
    authenticate
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


  helpers do #just to all access
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def authenticate
      redirect('/') if current_user.nil?
    end
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
