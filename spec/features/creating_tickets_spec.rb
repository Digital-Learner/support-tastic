require 'rails_helper'

describe "Creating Tickets" do

  before do
    visit '/'
    click_link "New Ticket"
  end

  scenario "Creating a ticket" do
    fill_in "Name", with: "Brian Smith"
    fill_in "Email", with: "brian.smith@example.com"
    select "Marketing", from: "Department"
    fill_in "Subject", with: "Tweets not appearing on Twitter"
    fill_in "Detail", with: "As of 0900 on the 25th August tweets stopped .."
    click_button "Create Ticket"

    expect(page).to have_content "A new Ticket has been created."
  end

  scenario "cannot create a ticket without valid attributes" do
    click_button "Create Ticket"

    expect(page).to have_content "Unable to create Ticket."
  end
end
