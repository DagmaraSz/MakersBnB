require 'data_mapper'
require 'dm-postgres-adapter'
class Date
  include DataMapper::Resource

  p "hello 5"

has n, :spaces, through: Resource

property :id, Serial
property :date, String #change to decimal possibly
# property :month, Integer

end
