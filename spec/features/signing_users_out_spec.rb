require "rails_helper"

RSpec.feature "Signing out signed-in users" do
    
  before do
    @thi = User.create!(email: "baothi246@gmail.com", password: "password" )
    visit "/"
    
    click_link "sign in"
    fill_in "Email", with: @thi.email
    fill_in "Password", with: @thi.password
    click_button "Log in"
  end
  scenario "with valid creadentials" do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("signed out successfully.")
  end
end