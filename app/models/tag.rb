class Tag < ActiveRecord::Base
	has_many :favorites
	has_many :users, :through => :favorites
	belongs_to :artist
	belongs_to :user

	scope :artist_work, ->(id) { where(artist_id: id) }
	scope :user_contributions, ->(id) { where(user_id: id) }
end