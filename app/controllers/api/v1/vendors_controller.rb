module Api
  module V1
    class VendorsController < ApplicationController
      respond_to :json
      before_filter :authenticate_user!

      def index
        respond_with Vendor.all
      end

      private

      def vendor_params
        params.require(:vendor).permit(:title, :description, :summary, :vendor_type, :thumbnail, :phone_number, :website_url, :address, :city, :state, :zip_code)
      end
    end
  end
end