require 'rails_helper'

describe "Viewing Tickets" do

  before do
    visit '/'
    click_link "Log in"
  end

  scenario "Viewing a ticket" do
    click_link "ABC-123-ABC-123-ABC"

    expect(page).to have_content "A new Ticket has been created."
  end

end
