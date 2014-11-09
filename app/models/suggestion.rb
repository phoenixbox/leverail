class Suggestion < ActiveRecord::Base
	# Associations
	has_many :proposals

	has_many :upvotes
	has_many :users, :through => :upvotes

	belongs_to :user
	belongs_to :artist
end