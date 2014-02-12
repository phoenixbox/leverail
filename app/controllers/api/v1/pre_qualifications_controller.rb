module Api
  module V1
    class PreQualificationsController < ApplicationController
      respond_to :json

      def index
        @pre_qualifications = PreQualification.all
      end

      def show
        @pre_qualification = PreQualification.find(params[:id])
      end

      def create
        user = User.find_by_authentication_token(params[:authentication_token])
        user.vendors << Vendor.find(params[:vendor_id])
        redirect_to api_v1_user_path user
      end

      def update
      end

      def destroy
      end

      private

      def pre_qualification_params
        params.require(:pre_qualification).permit(:user_id, :vendor_id, :assigned, :start_time, :end_time)
      end
    end
  end
end