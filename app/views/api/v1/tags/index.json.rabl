collection @tags => :pieces

attributes :id, :title, :city, :image_url, :state, :zip_code, :country, :canvas_type, :latitude, :longitude

child :artist => :artist do
  attributes :id, :email, :profile_image_url
end

node :favorite_count do |tag|
	tag.favorites.count
end