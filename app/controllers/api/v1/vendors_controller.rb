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
        params.require(:vendor).permit(:name)
      end

    end
  end
end