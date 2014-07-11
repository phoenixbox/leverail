FactoryGirl.define do
  factory :user do
    sequence(:email)        { |n| "#{n}#{Faker::Internet.email}" }
    password                'password'
    password_confirmation   'password'
    authentication_token    { Devise.friendly_token }
  end

  factory :hotel do
    name                   {Faker::Lorem.words(num = 1).join}
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

    # factory :vendor_with_users do
    #   after_create do |article|
    #     create(:comment, article: article)
    #   end
    # end
  end
  factory :competitor do
    vendor_id
    competitor_id
  end
  factory :pre_qualification do
    sequence(:start_time) { |n| Time.now }
    sequence(:end_time) { |n| Time.now + n.days + n.hour }
  end
  trait :assigned do
    assigned true
  end
end