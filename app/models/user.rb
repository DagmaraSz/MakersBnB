require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial

  property :email, String, required: true, unique: true,
    :format   => :email_address

  validates_presence_of :email

end
