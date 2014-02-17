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
        vendor = Vendor.find(params[:vendor_id])
        user.vendors << vendor if !user.vendors.include?(vendor)
        redirect_to api_v1_user_path user
      end

      def update
      end

      def destroy
        @user = User.find_by_authentication_token(params[:authentication_token])
        pre_qual_vendor = PreQualification.where("user_id = ? AND vendor_id = ?", @user.id, params[:vendor_id]).first
        pre_qual_vendor.delete
        @user.reload
        redirect_to api_v1_user_pre_qual_path @user
        # else
        #   render :json => { :status => 403, :message => "Request not processed" }
        # end
      end

      private

      def pre_qualification_params
        params.require(:pre_qualification).permit(:user_id, :vendor_id, :assigned, :start_time, :end_time)
      end
    end
  end
end