FactoryGirl.define do
  factory :blog_entry do
    sequence(:name) { |n| "Blog Entry Part #{n}" }
    summary { "This is a very nice post about stuff" }
    sequence(:published_at) { |n| Time.zone.today + n }
    guid { SecureRandom.uuid }
  end
end
