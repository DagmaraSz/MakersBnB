require 'data_mapper'
require 'dm-postgres-adapter'
require 'carrierwave/datamapper'
require_relative '../uploaders/image_uploader'

class Image
  include DataMapper::Resource

  property :id, Serial

  property :image, Text

  mount_uploader :image, ImageUploader
end
