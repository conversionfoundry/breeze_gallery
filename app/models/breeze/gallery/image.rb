module Breeze
  module Gallery
    class Image < Breeze::Content::Asset
      field :image_width, :type => Integer
      field :image_height, :type => Integer

      belongs_to_related :gallery, :class_name => "Breeze::Gallery::Gallery", :inverse_of => :images

      mount_uploader :file, GalleryUploader, :mount_on => :file
    end
  end
end
