Given(/^there is a ticket which is not closed$/) do
  department = FactoryGirl.create(:department)
  @ticket = FactoryGirl.create(:ticket, subject: "Staff cannot add comments",
                                        department_id: department.id
                              )
  @ticket.save
end


Given(/^I am able to add comments to the ticket$/) do
  visit root_path
  click_link "Log in"
  fill_in "Name", with: "claire"
  fill_in "Password", with: "password"
  click_button "Log in"
  click_link Ticket.all.waiting_staff_response.first.reference_id
end

Given(/^I add valid details to the comments form$/) do
  @comment = "Fixed & passes on CI"
  fill_in "comment_comment", with: @comment
  click_button "Create Comment"
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^I should see the comment on the ticket$/) do
  expect(page).to have_content("Comment recorded and ticket updated.")
  steps(
        %Q(
          Then they should see "#{@comment}" within "#ticket #comments"
        )
      )
end
