object @suggestion

attributes :id, :address, :latitude, :longitude, :state, :city, :zip_code, :country, :canvas_type, :image_url

child @user => :suggestor do
  attributes :id, :email, :profile_image_url
end

node :upvote_count do |suggestion|
	suggestion.upvotes.count
end