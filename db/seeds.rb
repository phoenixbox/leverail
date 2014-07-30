require 'ffaker'

User.destroy_all
Vendor.destroy_all
# PreQualification.destroy_all

u = User.create(email:"rogerssh@tcd.ie", password:12345678, password_confirmation:12345678)

ADDRESSES = YAML.load_file('db/addresses.yml')
10.times do |n|
  puts "Creating vendor number: #{n}"
  vendor = FactoryGirl.build(:vendor)
  vendor.address = ADDRESSES[n]['address']
  vendor.city = ADDRESSES[n]['city']
  vendor.state = ADDRESSES[n]['state']
  vendor.zip_code = ADDRESSES[n]['zip_code']
  vendor.save
end

10.times do |n|
	puts "Creating hotel number: #{n}"
	FactoryGirl.create(:hotel)
end