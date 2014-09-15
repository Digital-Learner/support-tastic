require 'rails_helper'

describe "Viewing Tickets" do
  let!(:department) { FactoryGirl.create(:department, name: 'Production') }
  let!(:ticket) { FactoryGirl.create(:ticket, name: "David Latimer",
                                              email: "d.j.latimer@example.com",
                                              department_id: department.id,
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

  # scenario "New unassigned tickets", js: true, webkit: false, driver: :webkit do
  scenario "New unassigned tickets" do
    expect(page).to have_selector('dl.tabs')
    expect(page).to have_selector('.content.active#panel-1')

    within('.content#panel-1') do
      expect(page).to     have_content('New unassigned tickets')
      expect(page).to_not have_content('Open Tickets')
      expect(page).to_not have_content('On-hold Tickets')
      expect(page).to_not have_content('Closed Tickets')
    end
  end

  scenario "Open Tickets" do
    within('.content#panel-2') do
      expect(page).to     have_content('Open Tickets')
    end
  end

  scenario "On-hold Tickets" do
    within('.content#panel-3') do
      expect(page).to     have_content('On-hold Tickets')
    end
  end

  scenario "Closed Tickets" do
    within('.content#panel-4') do
      expect(page).to     have_content('Closed Tickets')
    end
  end
end
