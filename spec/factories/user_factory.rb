FactoryGirl.define do
  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.safe_email }
    password 'password'
    password_confirmation 'password'
  end
end
