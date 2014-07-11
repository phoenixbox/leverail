require 'ffaker'

User.destroy_all
Vendor.destroy_all
# PreQualification.destroy_all

u = User.create(email:"rogerssh@tcd.ie", password:12345678, password_confirmation:12345678)

10.times do |n|
  puts "Creating vendor number: #{n}"
  FactoryGirl.create(:vendor)
end

10.times do |n|
	puts "Creating room number: #{n}"
	FactoryGirl.create(:hotel)
end

# count = 3

# vendors = Vendor.all
# u.vendors << vendors.sample(count)

# count.times do |n|
#   puts "Creating PreQualification: #{n}"
#   FactoryGirl.create(:pre_qualification, user_id:u.id, vendor_id: u.vendors[n].id)
# end