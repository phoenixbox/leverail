class Tag < ActiveRecord::Base
	has_many :favorites
	has_many :users, :through => :favorites
	belongs_to :artist

	scope :artist_work, ->(id) { where(artist_id: id) }
end