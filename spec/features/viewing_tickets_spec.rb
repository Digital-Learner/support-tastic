require 'rails_helper'

describe "Viewing Tickets" do
  let!(:ticket) { FactoryGirl.create(:ticket, name: "David Latimer",
                                              email: "d.j.latimer@example.com",
                                              department_id: '4',
                                              subject: "Viewing ticket by references"
                                    )
                }

  before do
    visit '/'
    click_link "Log in"
    fill_in "Name", with: "david"
    fill_in "Password", with: "staff-password"
    click_button "Log in"
  end

  scenario "Viewing a ticket" do
    click_link ticket.reference_id

    expect(page).to have_content "Subject: Viewing ticket by references"
  end

end
