require 'data_mapper'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, Text
  property :postcode, Text
  property :price, Decimal
end
