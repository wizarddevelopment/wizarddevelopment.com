FactoryGirl.define do
  factory :freshbooks_invoice do
    sequence(:invoice_id)  { |n| "00001000#{n}" }
    sequence(:number) { |n| 01000 + n }
    organization 'The Shop'
    client_id '35674'
    status 'paid'
    amount 50.0
    amount_outstanding 0.0
    paid 50.0
    public_url "http://www.freshbooks.com"
    date { Time.now }
  end
end
