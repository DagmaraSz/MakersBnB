
ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/data_mapper_setup'


class MakersBnb < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

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

  post '/users' do
    user = User.new(email: params[:email_signup], password: params[:password_signup], password_confirmation: params[:password_confirmation])
    user.save
    redirect '/spaces'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'home'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
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
