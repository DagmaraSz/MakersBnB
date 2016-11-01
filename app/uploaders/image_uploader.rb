require 'carrierwave/datamapper'
require 'carrierwave'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
end
