class Suggestion < ActiveRecord::Base
	# Associations
	has_many :proposal_suggestions
	has_many :proposals, :through => :proposal_suggestions

	has_many :upvotes
	has_many :users, :through => :upvotes

	has_many :suggestion_users
	has_many :users, :through => :suggestion_users
end