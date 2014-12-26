FactoryGirl.define do
  factory :blog_entry do
    sequence(:name)  { |n| "Blog Entry Part #{n}" }
    sequence(:summary) { "Lorem ipsum dolor sit amet, consectetur adipisicing elit." }
    sequence(:published_at) { |n| DateTime.new(2014, 8, n, 22, 35, 0) }
    sequence(:guid) { SecureRandom.uuid }
  end
end
