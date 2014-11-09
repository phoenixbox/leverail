class DeleteProposalSuggestions < ActiveRecord::Migration
  def change
    	drop_table :proposal_suggestions
    end
end
