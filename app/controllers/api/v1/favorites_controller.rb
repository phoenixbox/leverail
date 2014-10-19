module Api
  module V1
    class FavoritesController < ApplicationController
      respond_to :json

      def create
        piece = Tag.find(params[:piece_id])
        favorite = piece.favorites.create(user_id: @user.id)
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
	      	favorite.delete
	      	render :json=>{:success=>true, :message=>"Favorited deleted", :status=>200}, :status=>200
      	rescue => e
    			render :json=>{:success=>false, :message=>"Could not find favorite", :status=>422}, :status=>422
      	end
      end

      def favorited
      	begin
	      	favorite = Favorite.where("user_id = ? AND tag_id = ?", params[:user_id], params[:tag_id]).first
	      	redirect_to api_v1_favorite_path(favorite)
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