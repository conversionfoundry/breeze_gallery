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

            file.versions.each do |name, v|
              if name.to_s == crop[:version]
                
                file.manipulate! do |image|
                v.manipulate! do |img|
                  img = image.crop(crop[:x].to_i, crop[:y].to_i, crop[:w].to_i, crop[:h].to_i)
                  img.resize!(crop[:width].to_i, crop[:height].to_i)
                  img
                end
                image
                end
              end
            end

        #     target_width, target_height = @crop[:target_width].to_i, @crop[:target_height].to_i
        #   if target_width > 0 && target_height > 0 && (target_width < image_width || target_height || image_height)
        #     w, h = image_width, image_height
            
        #     file.manipulate! do |img|
        #       if r = selection_rect
        #         img.crop! r[:x], r[:y], r[:width], r[:height]
        #         w, h = r[:width], r[:height]
        #       end
              
        #       if target_width > 0 && target_height > 0 && (w > target_width || h > target_height)
        #         if @crop[:mode].to_s == "resize_to_fit" then
        #           img.resize_to_fit! target_width, target_height
        #         else
        #           img.resize_to_fill! target_width, target_height
        #         end
        #       end
              
        #       write_attribute :image_width, img.columns
        #       write_attribute :image_height, img.rows
              
        #       img
        #     end
            
        #     file.versions.each do |name, v|
        #       v.cache! file.file
        #       v.store!
        #     end
        # end

          end
        end
    end
  end
end
