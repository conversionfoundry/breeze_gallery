module Breeze
  module Gallery
    class Instance < Breeze::Content::Item
      include Breeze::Content::Mixins::Placeable

      belongs_to_related :gallery, :class_name => "Breeze::Gallery::Gallery"

      def to_erb(view)
        returning("") do |str|
          str << "<div class='gallery'>"
          gallery.images.each do |image|
            str << "<img src='#{image.file.url(:thumbnail)}' />"
          end
          str << "</div>"
        end
      end
    end
  end
end
