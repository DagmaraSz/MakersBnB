require 'data_mapper'
require 'dm-postgres-adapter'
class Date
  include DataMapper::Resource

has n, :spaces, through: Resource

property :id, Serial
property :day, String #change to decimal possibly
# property :month, Integer

end
