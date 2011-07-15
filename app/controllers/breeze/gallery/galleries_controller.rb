module Breeze
  module Gallery
    class GalleriesController < Breeze::Admin::AdminController
      def index
        @galleries = Breeze::Gallery::Gallery.all
      end

      def new
        @gallery = Breeze::Gallery::Gallery.new
      end

      def create
        @gallery = Breeze::Gallery::Gallery.new params[:gallery]
        @gallery.save
      end

      def edit
        @gallery = Breeze::Gallery::Gallery.find params[:id]
      end

      def update
        @gallery = Breeze::Gallery::Gallery.find params[:id]
        @gallery.attributes = params[:gallery]
        @gallery.save
      end
    end
  end
end