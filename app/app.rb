
ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'carrierwave'
require 'sinatra/flash'
require_relative 'models/data_mapper_setup'

CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end

class MakersBnb < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

  set :root,    File.dirname(__FILE__)

  enable :sessions

  get '/' do
    redirect '/spaces' unless session[:user_id].nil?
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
    @user = User.new(email: params[:email_signup], password: params[:password_signup], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/spaces'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'home'
    end
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

  get '/image' do
    @image = Image.last
    erb :image
  end

  get '/image/new' do
    # @images = Image.all
    erb :'image_upload'
  end

  post '/image/new' do
    img = Image.new
    my_uploader = ImageUploader.new
    my_uploader.store!(params[:file])
    img[:image] = params[:file][:filename]
    img.save!
    redirect('/image')
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
