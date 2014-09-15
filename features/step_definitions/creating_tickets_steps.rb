Given(/^they are on the homepage$/) do
  visit '/'
end

Given(/^they choose to create a new ticket$/) do
  click_link "New Ticket"
end

When(/^they complete the form with valid information$/) do
  @subject = "Tweets not appearing on Twitter"
  fill_in "Name", with: "Brian Smith"
  fill_in "Email", with: "brian.smith@example.com"
  select "Marketing", from: "Department"
  fill_in "Subject", with: @subject
  fill_in "Detail", with: "As of 0900 on the 25th August tweets stopped .."

  click_button "Create Ticket"
end

Then(/^they should see "([^"]*)"$/) do |expected_output|
  expect(page).to have_content(expected_output)
end

Then(/^they should see "(.*?)" within "(.*?)"$/) do |content, css_selectors|
  within(css_selectors) do
    expect(page).to have_content content
  end
end

When(/^they submit an incomplete form or form with invalid information$/) do
  click_button "Create Ticket"
end

Then(/^an error message should be presented$/) do
  expect(page).to have_selector('#error_explanation')
end

Then(/^they should receive an email with a link to ticket$/) do
  steps(
        %Q(
          When "brian.smith@example.com" opens the email
          Then they should see a subject of "Support Request: #{@subject}, Ticket Reference: " with a Reference format of "ABC-123-ABC-123-ABC"
          And they should see "Thank you for creating ticket " in the email body
          And they click the first link in the email

          Then they should see "Subject: #{@subject}" within "#ticket h3"
        )
      )
end
          # And they follow "view this ticket in your browser" in the email




Then(/^they should see a subject of "([^"]*)" with a Reference format of "([^"]*)"$/) do |subject, reference_format|
  current_email = ActionMailer::Base.deliveries.last
  actual_subject = current_email.subject
  reference = actual_subject.split(':').last.strip

  # make sure if the reference_format is changed it is detected
  expect(reference_format).to match(/^[A-Z]{3}-\d{3}-[A-Z]{3}-\d{3}-[A-Z]{3}$/)

  # no perform 'real' test
  expect(reference).to match(/^[A-Z]{3}-\d{3}-[A-Z]{3}-\d{3}-[A-Z]{3}$/)
end
