class PreQualification < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor
  validates_uniqueness_of :user_id, :scope => :vendor_id
end