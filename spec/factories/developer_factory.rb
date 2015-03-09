FactoryGirl.define do
  factory :developer do
    sequence(:name)  { |n| "Cool Person #{n}" }
    bio "This is a very nice person and stuff"
  end
end
