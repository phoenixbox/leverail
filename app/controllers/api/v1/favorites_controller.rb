module Api
  module V1
    class FavoritesController < ApplicationController
      respond_to :json

      def create
        tag = Tag.find(params[:piece_id])
        favorite = tag.favorites.create(user_id: params[:user_id])
        if favorite.valid?
        	redirect_to api_v1_favorite_path(favorite)
        else
					render :json=>{:success=>false, :message=>"Could not create favorite", :status=>422}, :status=>422
        end
      end

      def show
        @favorite = Favorite.find(params[:id])
      end

      def destroy
        begin
          favorite = Favorite.find(params[:id])
          tag = favorite.tag
          favorite.delete
          redirect_to api_v1_tag_path(tag)
        rescue => e
          render :json=>{:success=>false, :message=>"Could not find favorite", :status=>422}, :status=>422
        end
      end

      def favorited
      	begin
	      	favorite = Favorite.where("user_id = ? AND tag_id = ?", params[:user_id], params[:tag_id]).first
          if favorite
  	      	redirect_to api_v1_favorite_path(favorite)
          else
            render :json=>{:success=>false, :message=>"Could not find favorite", :status=>422}, :status=>422
          end
      	rescue => e
    			render :json=>{:success=>false, :message=>"Could not find favorite", :status=>422}, :status=>422
      	end
      end

      private

      def upvote_params
        params.require(:favorite).permit(:piece_id, :user_id)
      end
    end
  end
end