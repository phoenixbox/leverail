module Api
  module V1
    class TagsController < ApplicationController
      respond_to :json

      def index
        @hotels = Tag.all
      end

      private

      def tag_params
        params.require(:tag).permit(:user_id, :title, :video_url)
      end
    end
  end
end