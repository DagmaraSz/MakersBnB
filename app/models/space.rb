require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, String
  property :postcode, String
  property :price, Float
  property :owner, String
  has n, :calendars, through: Resource
  has n, :bookings

end
