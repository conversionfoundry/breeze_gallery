module Breeze
  module Gallery
    class Instance < Breeze::Content::Item
      include Breeze::Content::Mixins::Placeable
  
      field :template
      belongs_to_related :gallery, :class_name => "Breeze::Gallery::Gallery"

      TEMPLATES = [ :tour ]

      def self.label
        "Gallery"
      end

      def to_erb(view)
        partial =  "/partials/gallery/#{template}"
        begin
          view.controller.render_to_string :partial => partial, :layout => false, :locals => { :gallery => gallery }
        rescue ActionView::MissingTemplate
          %{<div class="rendering-error"><h3>Missing Template</h3><p>Could not find partial template: #{partial}</p></div>}
        rescue Exception => e
          %{<div class="rendering-error"><h3>#{e.to_s}</h3><p>#{e.message}</p></div>}
        end
      end

#        returning("") do |str|
 #         str << "<div class='gallery'>"
#        gallery.images.each do |image:Ack 
 #           str << "<img src='#{image.file.url(:thumbnail)}' />"
  #        end
   #       str << "</div>"
    #    end
    #  end
    end
  end
end
