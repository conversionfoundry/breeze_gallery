module Breeze
  module Gallery
    class GalleryUploader < AssetUploader
      version :icon      do
        process :resize_to_fit   => [  48,  48 ]
      end

      version :thumbnail do
        process :resize_to_limit => [ 128, 128 ]
      end

      version :preview   do
        process :resize_to_limit => [ 224, 224 ]
      end
 
    end
  end
end
