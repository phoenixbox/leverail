module Api
  module V1
    class ArtistsController < ApplicationController
      respond_to :json

      def artist_work
        artist = Artist.find(params[:id])
        @pieces = artist.tags
      end

      private

      def artist_params
        params.require(:artist).permit(:name, :profile_image_url)
      end
    end
  end
end