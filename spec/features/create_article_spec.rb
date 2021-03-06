require "rails_helper"

RSpec.feature "Creating Ariticles" do
  
  before do
    @thi = User.create!(email: "baothi246@gmail.com", password: "password")
    login_as(@john)
  end
  
  scenario "A user creates a new article " do
    visit "/"
    
    click _link "New Article"
    
    fill_in "Title", with: "Creating first article"
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Create Article"
    expect(page).to have_content("Ariticle has been created")
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Create by : #{@thi.email}")
  end
  
  scenario "A user fails to create a new article" do
    visit "/"
    
    click _link "New Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"
    
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end