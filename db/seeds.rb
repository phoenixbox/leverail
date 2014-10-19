require 'ffaker'

User.destroy_all
Vendor.destroy_all
# PreQualification.destroy_all

u = User.create(email:"rogerssh@tcd.ie", password:12345678, password_confirmation:12345678, profile_image_url: "https://scontent-a-pao.xx.fbcdn.net/hphotos-xaf1/v/t1.0-9/1456512_10202479209041132_1776449871_n.jpg?oh=55d7de54c815ba7a6c6039c327e1f155&oe=54C1A2AA")

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
IMAGE_URLS = YAML.load_file('db/image_urls.yml')
10.times do |n|
  puts "Creating tag number: #{n}"
  tag = Tag.new
  tag.title = TAG_ADDRESSES[n]['title']
  tag.city = TAG_ADDRESSES[n]['city']
  tag.state = TAG_ADDRESSES[n]['state']
  tag.zip_code = TAG_ADDRESSES[n]['zip_code']
  tag.country = 'United States'
  tag.canvas_type = 'Public Wall'
  tag.latitude = TAG_ADDRESSES[n]['location']['latitude']
  tag.longitude = TAG_ADDRESSES[n]['location']['longitude']
  tag.image_url = 'https://s3-us-west-2.amazonaws.com/artocracy.bananas/12A1EF9D-7109-42BB-B675-0F4BEA5475C9'
  tag.save
end

10.times do |n|
	puts "Creating hotel number: #{n}"
	FactoryGirl.create(:hotel)
end
# IMAGE_URLS.each{|url|suggestion.proposals.create(image_url: url['image_url'], proposer_id: u.id)}