module Api
  module V1
    class VendorsController < ApplicationController
      respond_to :json
      #before_filter :authenticate_user!

      def index
        @vendors = Vendor.all
      end

      def show
        @vendor = Vendor.find(params[:id])
      end

      private

      def vendor_params
        params.require(:vendor).permit(:title, :description, :summary, :vendor_type, :thumbnail, :phone_number, :website_url, :address, :city, :state, :zip_code)
      end
    end
  end
end