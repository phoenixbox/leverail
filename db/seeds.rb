require 'ffaker'

User.destroy_all
Vendor.destroy_all
# PreQualification.destroy_all

u = User.create(email:"rogerssh@tcd.ie", password:12345678, password_confirmation:12345678)

VENDOR_ADDRESSES = YAML.load_file('db/vendor_addresses.yml')
10.times do |n|
  puts "Creating vendor number: #{n}"
  vendor = FactoryGirl.build(:vendor)
  vendor.address = VENDOR_ADDRESSES[n]['address']
  vendor.city = VENDOR_ADDRESSES[n]['city']
  vendor.state = VENDOR_ADDRESSES[n]['state']
  vendor.zip_code = VENDOR_ADDRESSES[n]['zip_code']
  vendor.save
end

TAG_ADDRESSES = YAML.load_file('db/tag_addresses.yml')
10.times do |n|
  puts "Creating tag number: #{n}"
  tag = Tag.new
  tag.title = TAG_ADDRESSES[n]['title']
  tag.address = TAG_ADDRESSES[n]['address']
  tag.city = TAG_ADDRESSES[n]['city']
  tag.state = TAG_ADDRESSES[n]['state']
  tag.zip_code = TAG_ADDRESSES[n]['zip_code']
  tag.latitude = TAG_ADDRESSES[n]['location']['latitude']
  tag.longitude = TAG_ADDRESSES[n]['location']['longitude']
  tag.save
end

10.times do |n|
	puts "Creating hotel number: #{n}"
	FactoryGirl.create(:hotel)
end