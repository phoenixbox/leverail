class Artist < ActiveRecord::Base
  has_many :tags
end