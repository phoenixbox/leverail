module Api
  module V1
    class UpvotesController < ApplicationController
      respond_to :json

      def create
        suggestion = Suggestion.find(params[:suggestion_id])
        upvote = suggestion.upvotes.create(user_id: params[:user_id])
        if upvote.valid?
        	redirect_to api_v1_upvote_path(upvote)
        else
					render :json=>{:success=>false, :message=>"Could not create upvote", :status=>422}, :status=>422
        end
      end

      def show
      	@upvote = Upvote.find(params[:id])
      end

      def destroy
      	begin
	      	upvote = Upvote.find(params[:id])
          suggestion = upvote.suggestion
	      	upvote.delete
	      	redirect_to api_v1_suggestion_path(suggestion)
      	rescue => e
    			render :json=>{:success=>false, :message=>"Could not find upvote", :status=>422}, :status=>422
      	end
      end

      def upvoted
      	begin
	      	upvote = Upvote.where("user_id = ? AND suggestion_id = ?", params[:user_id], params[:suggestion_id]).first
	      	redirect_to api_v1_upvote_path(upvote)
      	rescue => e
    			render :json=>{:success=>false, :message=>"Could not find upvote", :status=>422}, :status=>422
      	end
      end

      private

      def upvote_params
        params.require(:upvote).permit(:suggestion_id, :user_id)
      end
    end
  end
end