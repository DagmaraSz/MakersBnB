require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'user'
require_relative 'space'
require_relative 'dates'



DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
