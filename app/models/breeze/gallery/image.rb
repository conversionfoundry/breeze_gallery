module Breeze
  module Gallery
    class Image < Breeze::Content::Asset
      field :image_width, :type => Integer
      field :image_height, :type => Integer
      field :position, :type => Integer

      attr_accessor :crop

      belongs_to_related :gallery, :class_name => "Breeze::Gallery::Gallery", :inverse_of => :images

      mount_uploader :file, Breeze::Gallery::GalleryUploader, :mount_on => :file

      before_update :reprocess_file

      scope :ordered, order_by(:position.asc)

      protected
      
        def reprocess_file
          unless crop.blank?
            Rails.logger.debug "reprocess file".green
          end
        end
    end
  end
end
