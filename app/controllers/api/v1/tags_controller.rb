module Api
  module V1
    class TagsController < ApplicationController
      respond_to :json

      def index
        @tags = Tag.all
      end

      def show
        @tag = Tag.find(params[:id])
      end

      def create
        user = User.find(params[:user_id])
        piece = user.tags.create(piece_params)
        if piece
          # TODO: Whats the best way to redirect with authentication
          redirect_url = [api_v1_tag_path(piece),'?',@user.attributes.slice("email", "authentication_token").to_query].join
          redirect_to redirect_url
        else
          # TODO: Retrieve parameter errors and return to the user
          render :json=> {:success=>false, :message=>"There was an error with your piece", :status=>401}, :status=>401
        end
      end

      # TODO: The data model needs to be reflect the artist entities
      def artist_work
        @tags = Tag.artist_work(params[:artist_id])
      end

      private

      def piece_params
        convert_lat_long_to_bigdecimal
        params.require(:piece).permit(:title,:city,:state,:zip_code,:latitude,:longitude,:image_url,:artist_id,:canvas_type,:country,:user_id,:address)
      end

      def convert_lat_long_to_bigdecimal
        [:latitude, :longitude].each {|param| params[:piece][param] = params[:piece][param].to_d}
      end
    end
  end
end
