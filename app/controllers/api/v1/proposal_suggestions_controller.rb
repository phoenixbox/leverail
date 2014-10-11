module Api
  module V1
    class ProposalSuggestionsController < ApplicationController
      respond_to :json

      def index
      	@proposals = Suggestion.find(params[:suggestion_id]).proposals
      end

      private

      def proposal_suggestion_params
        params.require(:suggestion).permit(:suggestion_id, :proposal_id, :vote_count)
      end
    end
  end
end