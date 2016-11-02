class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  # def store_dir
  #   "app/uploads/tmp"
  # end

end
