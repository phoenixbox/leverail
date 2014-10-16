module Api
  module V1
    class TagsController < ApplicationController
      respond_to :json

      def index
        @tags = Tag.all
      end

      # u.favorites.create(tag_id: Tag.last)
      def favorites
        user = User.find(params[:user_id])
        @tags = user.tags
      end

      def artist_work
        @tags = Tag.artist_work(params[:artist_id])
      end

      private

      def tag_params
        params.require(:vendor).permit(:title, :address, :city, :state, :zip_code, :latitude, :longitude, :image_url)
      end
    end
  end
end