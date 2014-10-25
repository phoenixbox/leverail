object @user

node :favorite_count do |user|
	user.favorites.count
end

node :suggestion_count do |user|
	user.suggestions.count
end