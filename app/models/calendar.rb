require 'data_mapper'
require 'dm-postgres-adapter'
class Calendar
  include DataMapper::Resource

has n, :spaces, through: Resource

property :id, Serial
property :day, String

end
