FactoryGirl.define do
  factory :user do
    sequence(:email)        { |n| "#{n}#{Faker::Internet.email}" }
    password                'password'
    password_confirmation   'password'
  end
  factory :vendor do
    title                    { Faker::Company.name }
    description              { Faker::Lorem.sentence}
    summary                  { Faker::Lorem.paragraphs(paragraph_count = 2).join}
    vendor_type              { Faker::Lorem.words(num = 1).join}
    sequence(:thumbnail)     { |n| "#{n}#{Faker::Lorem.words(num=1).join}" }
    sequence(:phone_number)  { |n| "#{n}#{Faker::PhoneNumber.phone_number}" }
    sequence(:website_url)   { |n| "#{Faker::Internet.domain_name}#{n}" }
    sequence(:address)       { |n| "#{Faker::Address.street_address(include_secondary = false)}"}
    city                     { Faker::AddressUS.city}
    state                    { Faker::AddressUS.us_state_abbr}
    zip_code                 { Faker::AddressUS.zip_code}
  end
end