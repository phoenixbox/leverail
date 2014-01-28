# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vendor, :class => Vendor do
    name  { Faker::Name.name }
  end
end