module Api
  module V1
    class HotelsController < ApplicationController
      respond_to :json

      def index
        @hotels = Hotel.all
      end

      def show
        @hotel = Hotel.find(params[:id])
      end

      private

      def vendor_params
        params.require(:hotel).permit(:user_id, :title, :video_url)
      end
    end
  end
end