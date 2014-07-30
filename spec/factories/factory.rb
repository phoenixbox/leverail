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