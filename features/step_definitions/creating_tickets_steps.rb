Given(/^they are on the homepage$/) do
  visit '/'
end

Given(/^they choose to create a new ticket$/) do
  click_link "New Ticket"
end

When(/^they complete the form with valid information$/) do
  fill_in "Name", with: "Brian Smith"
  fill_in "Email", with: "brian.smith@example.com"
  fill_in "Subject", with: "Tweets not appearning on Twitter"
  fill_in "Detail", with: "As of 0900 on the 25th August tweets stopped .."

  click_button "Create Ticket"
end

Then(/^they should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
