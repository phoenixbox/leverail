FactoryGirl.define do
  factory :user, :class => User do
    name  { Faker::Name.name }
    sequence(:email) { |n| "#{n}#{Faker::Internet.safe_email}" }
    password 'password'
    password_confirmation 'password'
  end
end