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
  # belongs_to :user, required: false
  has n, :calendars, through: Resource
end
