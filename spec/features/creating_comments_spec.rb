require 'rails_helper'

feature "Creating comments" do

  let!(:department) { FactoryGirl.create(:department) }
  let!(:ticket)     { FactoryGirl.create(:ticket, subject: "Staff cannot add comments",
                                                  department_id: department.id
                                        )
                    }

  before do
    visit root_path
    click_link "Log in"
    fill_in "Name", with: "claire"
    fill_in "Password", with: "password"
    click_button "Log in"
  end

  scenario "Creating a comment" do
    comment_text = "Testing comments. Do they appear on the page \nabove the 'Add comment' text_area input?"
    click_link ticket.reference_id
    fill_in "comment_comment", with: comment_text

    click_button "Create Comment"

    expect(page).to have_content("Comment recorded and ticket updated.")
    within("#ticket #comments") do
      expect(page).to have_content(comment_text)
    end
  end
end
