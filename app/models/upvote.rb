class Upvote < ActiveRecord::Base
  belongs_to :suggestion
  belongs_to :user
  validates_uniqueness_of :suggestion_id, :scope => :user_id
end
