require 'data_mapper'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, Text
  property :price, Decimal
  property :description, Text
end
