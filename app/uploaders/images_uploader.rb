class ImagesUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
