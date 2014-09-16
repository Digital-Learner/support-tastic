require 'rails_helper'

describe "Viewing Tickets" do
  let!(:department) { FactoryGirl.create(:department, name: 'Production') }
  let!(:ticket) { FactoryGirl.create(:ticket, name: "David Latimer",
                                              email: "d.j.latimer@example.com",
                                              department_id: department.id,
                                              subject: "Viewing ticket by references"
                                    )
                }
  let!(:ticket_open) { FactoryGirl.create(:ticket, name: "Stanley D Latimer",
                                              email: "s.d.latimer@example.com",
                                              department_id: department.id,
                                              subject: "Display materials"
                                    )
                }
  let!(:ticket_await_staff) { FactoryGirl.create(:ticket, name: "Sarah-Jane Washington",
                                              email: "sj.washington@example.com",
                                              department_id: department.id,
                                              subject: "Complaint process"
                                    )
                }
  let!(:ticket_await_customer) { FactoryGirl.create(:ticket, name: "David Latimer",
                                              email: "d.j.latimer@example.com",
                                              department_id: department.id,
                                              subject: "Complaint process"
                                    )
                }
  let!(:ticket_on_hold) { FactoryGirl.create(:ticket, name: "Darcy Activy",
                                              email: "da1235@example.com",
                                              department_id: department.id,
                                              subject: "Payments taken from wrong card"
                                    )
                }
  let!(:ticket_completed) { FactoryGirl.create(:ticket, name: "Sarah-Jane Washington",
                                              email: "sj.washington@example.com",
                                              department_id: department.id,
                                              subject: "Payments taken on wrong date"
                                    )
                }
  let!(:ticket_cancelled) do
    cancelled = FactoryGirl.create(:ticket, name: "David Latimer",
                                              email: "d.j.latimer@example.com",
                                              department_id: department.id,
                                              subject: "Payments taken in wrong currency"
                                    )
    cancelled.state = State.find_by(name: "Cancelled")
    cancelled.save
    cancelled
  end


  before do
    ticket_await_customer.state = State.find_by(name: "Waiting for Customer")
    ticket_await_customer.save

    ticket_completed.state = State.find_by(name: "Completed")
    ticket_completed.save

    ticket_on_hold.state = State.find_by(name: "On Hold")
    ticket_on_hold.save

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
      expect(page).to     have_content('These are tickets not yet assigned to a staff member.')

      expect(page).to     have_content("#{ticket_await_staff.reference_id}")

      expect(page).to_not have_content("#{ticket_on_hold.reference_id}")
      expect(page).to_not have_content("#{ticket_cancelled.reference_id}")
      expect(page).to_not have_content("#{ticket_completed.reference_id}")
    end
  end

  scenario "Open Tickets" do
    within('.content#panel-2') do
      expect(page).to     have_content("#{ticket_await_customer.reference_id}")

      expect(page).to_not have_content("#{ticket_on_hold.reference_id}")
      expect(page).to_not have_content("#{ticket_cancelled.reference_id}")
      expect(page).to_not have_content("#{ticket_completed.reference_id}")
    end
  end

  scenario "On-hold Tickets" do
    within('.content#panel-3') do
      expect(page).to     have_content("#{ticket_on_hold.reference_id}")

      expect(page).to_not have_content("#{ticket_await_staff.reference_id}")
      expect(page).to_not have_content("#{ticket_await_customer.reference_id}")
      expect(page).to_not have_content("#{ticket_cancelled.reference_id}")
      expect(page).to_not have_content("#{ticket_completed.reference_id}")
    end
  end

  scenario "Closed Tickets" do
    within('.content#panel-4') do
      expect(page).to     have_content("#{ticket_cancelled.reference_id}")
      expect(page).to     have_content("#{ticket_completed.reference_id}")

      expect(page).to_not have_content("#{ticket_on_hold.reference_id}")
      expect(page).to_not have_content("#{ticket_await_customer.reference_id}")
      expect(page).to_not have_content("#{ticket_await_staff.reference_id}")
    end
  end
end
