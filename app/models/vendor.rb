class Vendor < ActiveRecord::Base

  # Validations
  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :summary, :presence => true
  validates :vendor_type, :presence => true
  validates :thumbnail, :presence => true, :uniqueness => true
  validates :phone_number, :presence => true, :uniqueness => true
  validates :website_url, :presence => true, :uniqueness => true
  validates :address, :presence => true, :uniqueness => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip_code, :presence => true

end
