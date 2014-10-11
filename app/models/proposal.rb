class Proposal < ActiveRecord::Base
	# Associations
	has_many :proposal_suggestions
	has_many :suggestions, :through => :proposal_suggestions
end
