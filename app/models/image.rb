require 'carrierwave/datamapper'
require 'data_mapper'


class Image
  include DataMapper::Resource

  property :id, Serial

  mount_uploader :source, ImageUploader
end
