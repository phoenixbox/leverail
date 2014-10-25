object @favorite

attributes :id, :tag_id, :user_id

node :count do |f|
	f.tag.favorites.count
end