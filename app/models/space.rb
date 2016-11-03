require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  has n, :calendars, through: Resource
  belongs_to :user

  property :id, Serial
  property :name, String
  property :address, Text
  property :postcode, Text
  property :price, Float
  # property :owner, Text
end
