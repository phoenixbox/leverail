module Api
  module V1
    class SuggestionsController < ApplicationController
      respond_to :json

      def index
        @suggestions = Suggestion.all
      end

      def create
        user = User.find(params[:user_id])
        suggestion = user.suggestions.create(suggestion_params)
        if suggestion
          # TODO: Whats the best way to redirect with authentication
          redirect_url = [api_v1_suggestion_path(suggestion),'?',@user.attributes.slice("email", "authentication_token").to_query].join
          redirect_to redirect_url
        else
          # TODO: Retrieve parameter errors and return to the user
          render :json=> {:success=>false, :message=>"There was an error with your suggestion", :status=>401}, :status=>401
        end
      end

      def show
        @suggestion = Suggestion.find(params[:id])
      end

      def suggestions_proposals
        s = Suggestion.find(params[:id])
        @proposals = s.proposals
      end

      private

      def suggestion_params
        convert_lat_long_to_bigdecimal
        params.require(:suggestion).permit(:address, :title, :latitude, :longitude, :state, :city, :zip_code, :country, :canvas_type, :image_url, :user_id)
      end

      def convert_lat_long_to_bigdecimal
        [:latitude, :longitude].each {|param| params[:suggestion][param] = params[:suggestion][param].to_d}
      end
    end
  end
end