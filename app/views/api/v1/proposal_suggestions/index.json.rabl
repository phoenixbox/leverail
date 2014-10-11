collection @proposals => :proposals

attributes :id, :proposer_id, :image_url

node(:vote_count) do |proposal|
	proposal.proposal_suggestions.first.vote_count
end