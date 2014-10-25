collection @suggestions => :suggestions

attributes :id, :address, :latitude, :longitude, :state, :city, :zip_code, :country, :canvas_type, :image_url

child @user => :suggestor do
  attributes :id, :email, :profile_image_url
end

node(:proposal_count) do |suggestion|
	suggestion.proposals.count
end

node(:upvote_count) { |suggestion| suggestion.upvotes.count }