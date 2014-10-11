class Suggestion < ActiveRecord::Base
	# Associations
	has_many :proposal_suggestions
	has_many :proposals, :through => :proposal_suggestions
end