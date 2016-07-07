require "rails_helper"

RSpec.feature "Deleting an Article" do

  before do
    thi = User.create(email: "baothi246@gmail.com", password: "password")
    login_as(thi)
    @article = Article.create(title: "The first articles", body: "Body of first article")
  end
  
  scenario "Display individual article" do
      visit "/"
      click_link @article.title
      click_link "Delete Article"
      
      expect(page).to have_content("Article has been deleted")
      expect(current_path).to eq(article_path(@article))
  end
  
end