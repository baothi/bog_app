require "rails_helper"

RSpec.feature "Show an Article" do

  before do
    @article = Article.create(title: "The first articles", body: "Body of first article")
  end
  
  scenario "Display individual article" do
      vist "/"
      click_link @article.title
      
      expect(page).to have_content(@article.title)
      expect(page).to have_content(@article.body)
      expect(current_path).to eq(article_path(@article))
  end
  
end