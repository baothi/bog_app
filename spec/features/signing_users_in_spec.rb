require "rails_helper"

RSpec.feature "Users sign-in" do
  
  before do
    @thi = User.create!(email: "baothi246@gmail.com", password: "password")
  end
  
  scenario "with valid creadentials " do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @thi.email
    fill_in "Password", with: @thi.password
    click_button "Log in"
    
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@thi.email}")
    
  end
end