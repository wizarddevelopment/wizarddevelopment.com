Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I submit the contact request form correctly$/) do
  fill_in "Name", with: "Mando"
  fill_in "Email", with: "mando@wiz.com"
  fill_in "Phone Number", with: "1234123412"
  fill_in "What can we help you with?", with: "Help!"
  click_on "Send Request!"
end

Then(/^I should see a confirmation message$/) do
  expect(page).to have_content("We got the message.")
end

Then(/^there should be mail delivered$/) do
  expect(ActionMailer::Base.deliveries.count).to eq(1)
end
