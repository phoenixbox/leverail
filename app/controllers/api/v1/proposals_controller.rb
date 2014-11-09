module Api
  module V1
    class ProposalsController < ApplicationController
      respond_to :json

      private

      def proposal_params
        params.require(:proposal).permit(:image_url, :artist_id, :suggestion_id)
      end
    end
  end
end