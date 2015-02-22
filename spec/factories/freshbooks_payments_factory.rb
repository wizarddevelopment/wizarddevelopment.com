FactoryGirl.define do
  factory :freshbooks_payment do
    payment_id "555084"
    invoice_id "00001354033"
    client_id "107996"
    payment_type "MASTERCARD"
    amount 4800.00
    currency_code "USD"
    from_credit 0
    notes "Stripe: ch_5MCG3t4L1VHqP9"
    gateway_reference_id "4"
    gateway_name "Stripe"
    date "2014-12-19 00:00:00"
    updated "2014-12-19 11:44:58"
  end
end
