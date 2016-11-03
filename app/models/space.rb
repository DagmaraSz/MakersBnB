require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, Text
  property :postcode, Text
  property :price, Float
  property :owner, Text
  # belongs_to :user, required: false
  has n, :calendars, through: Resource
end
