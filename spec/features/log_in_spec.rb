require 'rails_helper'

feature "Log in" do
  scenario 'Logging in via form' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Log in'
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button "Log in"
    expect(page).to have_content("Logged in successfully.")
  end
end
