require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

has n, :dates, through: Resource

  property :id, Serial
  property :name, String
  property :address, Text
  property :postcode, Text
  property :price, Decimal
end
