require 'ffaker'

Vendor.destroy_all
# PreQualification.destroy_all

# u = User.last

10.times do |n|
  puts "Creating vendor number: #{n}"
  FactoryGirl.create(:vendor)
end

# count = 3

# vendors = Vendor.all
# u.vendors << vendors.sample(count)

# count.times do |n|
#   puts "Creating PreQualification: #{n}"
#   FactoryGirl.create(:pre_qualification, user_id:u.id, vendor_id: u.vendors[n].id)
# end