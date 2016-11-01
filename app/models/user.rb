require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  attr_accessor :password_confirmation
  attr_reader :password

  include DataMapper::Resource

  property :id, Serial

  property :email, String, required: true, unique: true,
    :format   => :email_address

  property :password_digest, Text, required: true

  validates_confirmation_of :password
  validates_length_of :password, :min => 6
  validates_presence_of :email


  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
