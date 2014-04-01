Given(/^I am on the homepage$/) do
  visit root_path
end

Given(/^I am on the business contact page$/) do
  visit business_path
end

Given(/^I am on the dev team contact page$/) do
  visit devteam_path
end

When(/^I submit a dev team contact request$/) do
  within '.devteam-contact' do
    fill_in 'contact_request_name', with: 'Francis Gulotta'
    fill_in 'contact_request_email', with: 'francis@wizarddevelopment.com'
    fill_in 'contact_request_phone', with: '2125551212'
    check 'contact_request_deploy_master'
    fill_in 'contact_request_message', with: 'I HAVE BIG OPPERTUNITY PLS CALL'
    click_button 'send your message'
  end
end

When(/^I submit a business contact request$/) do
  within '.business-contact' do
    fill_in 'contact_request_name', with: 'Francis Gulotta'
    fill_in 'contact_request_email', with: 'francis@wizarddevelopment.com'
    fill_in 'contact_request_phone', with: '2125551212'
    select 'Yes I have my own team.', from: 'contact_request_dev_team'
    select "Stalled (We've been developing for months and I worry we'll never launch!)", from: 'contact_request_product_status'
    fill_in 'contact_request_message', with: 'I HAVE BIG OPPERTUNITY PLS CALL'
    click_button 'send your message'
  end
end

Then(/^I get a message that my message has been recieved$/) do
  expect(page).to have_content(/thank you/i)
end


