module Api
  module V1
    class TagsController < ApplicationController
      respond_to :json

      def index
        @tags = Tag.all
      end

      private

      def tag_params
        params.require(:vendor).permit(:title, :address, :city, :state, :zip_code, :latitude, :longitude, :image_url)
      end
    end
  end
end