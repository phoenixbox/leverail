module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def show
        @user = User.find(params[:id])
      end

      def contribution_counts
      	@user = User.find(params[:id])
      end

      def favorites
        user = User.find(params[:id])
        @tags = user.tags
      end
    end
  end
end