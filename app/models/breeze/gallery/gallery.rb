module Breeze
  module Gallery
    class Gallery
      include Mongoid::Document
      identity :type => String

      field :title
      field :description
      has_many_related :images, :class_name => "Breeze::Gallery::Image"

      include Breeze::Content::Mixins::Placeable
    end
  end
end
