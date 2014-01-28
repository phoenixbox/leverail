class Vendor < ActiveRecord::Base

  #Validations
  validates :name, :presence => true, :uniqueness => true

end
