module Breeze
  module Gallery
    class ImagesController < Breeze::Admin::AdminController
      def new

      end

      def create
        if (@image = Breeze::Gallery::Image.where(:file => params[:Filename], :folder => params[:folder]).first)
          @image.file, @image.folder = params[:file], params[:folder]
        else
          @image ||= Breeze::Gallery::Image.from_upload params
          @image.gallery_id = params[:gallery_id]
          @image.position = @image.gallery.images.count
        end
        @image.save
        respond_to do |format|
          format.html { render :partial => @image.class.name.demodulize.underscore, :object => @image, :layout => false }
          format.js
        end
      end

      def edit
        @image = Breeze::Gallery::Image.find params[:id]
      end

      def destroy
        @image = Breeze::Gallery::Image.find params[:id]
        @image.try :destroy
      end

      def position
        @image = Breeze::Gallery::Image.find params[:id]
        @image.update_attributes params

        Breeze::Gallery::Image.where(:gallery_id => params[:gallery_id]).where(:position.gte => @image.position).each do |image|
          unless image._id == @image._id
            image.position += 1
            image.save
          end
        end

        render :nothing => true
      end

      def crop

      end
    end
  end
end
