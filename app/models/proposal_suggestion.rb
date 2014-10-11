class ProposalSuggestion < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :suggestion
  validates_uniqueness_of :proposal_id, :scope => :suggestion_id
end
