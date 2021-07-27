require "rails_helper"
RSpec.feature "Showing an Article" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    # login_as(john)
    @article = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consectetur.", user: @john) 
  end

  scenario "to a non-signed in user hides Edit/Delete Links" do
    visit "/"
    click_link @article.title
    expect(page).to have_content(@article.title) 
    expect(page).to have_content(@article.body) 
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article") 
  end
  scenario "A non-owner signed in cannot see both links" do 
    login_as(@fred)
    visit "/"
    click_link @article.title
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article") 
  end

  scenario "A signed in owner sees both links" do 
    login_as(@john)
    visit "/"
    click_link @article.title
    expect(page).to have_content(@article.title) 
    expect(page).to have_content(@article.body) 
    expect(current_path).to eq(article_path(@article))
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article") 
  end

  scenario "A user lists all articles" do

    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title) 
    expect(page).to have_content(@article.body) 
    expect(current_path).to eq(article_path(@article))
  end 
end