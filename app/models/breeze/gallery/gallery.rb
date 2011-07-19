module Breeze
  module Gallery
    class Gallery
      include Mongoid::Document
      identity :type => String

      field :title
      field :description

      field :full_width, type: Integer
      field :full_height, type: Integer
      field :thumb_width, type: Integer
      field :thumb_height, type: Integer
      field :preview_width, type: Integer
      field :preview_height, type: Integer

      has_many_related :images, :class_name => "Breeze::Gallery::Image"

    end
  end
end
