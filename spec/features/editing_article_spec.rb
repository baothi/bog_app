require "rails_helper"

RSpec.feature "Editing an Article" do

  before do
    thi = User.create(email: "baothi246@gmail.com", password: "password")
    login_as(thi)
    @article = Article.create(title: "The first articles", body: "Body of first article", user: thi)
  end
  
  scenario "A user updates an article" do
      visit "/"
      click_link @article.title
      click_link "Edit Article"
      
      fill_in "Title", with: "Update article"
      fill_in "Body", with: "Update body of article"
      click_button "Update Article"
      
      expect(page).to have_content("Article has been updated")
      expect(current_path).to eq(article_path(@article))
  end
  
  scenario "A user to update an article" do
      visit "/"
      click_link @article.title
      click_link "Edit Article"
      
      fill_in "Title", with: ""
      fill_in "Body", with: "Update body of article"
      click_button "Update Article"
      
      expect(page).to have_content("Article has been updated")
      expect(current_path).to eq(article_path(@article))
  end
  
end