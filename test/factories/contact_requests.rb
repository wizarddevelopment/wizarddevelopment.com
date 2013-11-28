# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_request do
    name "Francis Gulotta"
    email "francis@wizarddevelopment.com"
    phone "9175551212"
    business_name "Wizard Development"
    message "I need a website to sell my stuff"
    dev_team "I have one"
    product_status "Middle"
  end
end
