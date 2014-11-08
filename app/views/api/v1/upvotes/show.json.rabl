object @upvote

attributes :id, :suggestion_id, :user_id

node :count do |u|
	u.suggestion.upvotes.count
end