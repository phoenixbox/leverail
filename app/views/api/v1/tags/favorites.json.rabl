collection @tags => :favorites

attributes :id, :artist_id, :favorite_count, :city, :image_url, :state, :zip_code, :country, :canvas_type, :latitude, :longitude, :artist_name, :artist_image_url

child :artist do
  attributes :id, :name, :profile_image_url
end

node :favorite_count do |tag|
	tag.favorites.count
end
