FactoryGirl.define do
  factory :blog_entry do
    sequence(:name)  { |n| "Blog Entry Part #{n}" }
    summary { "This is a very nice post about stuff" }
    sequence(:published_at) { |n| DateTime.new(2014, 8, n, 22, 35, 0) }
    guid { SecureRandom.uuid }
  end
end
