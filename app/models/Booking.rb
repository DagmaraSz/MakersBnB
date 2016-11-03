require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource


  property :id, Serial
  property :user, String
  has 1, :space

end
