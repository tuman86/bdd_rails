require 'rails_helper'

RSpec.feature "Creating Article" do
  scenario "User creates a new post" do
	  visit "/"

	  click_link "New Article"

	  fill_in "Title", with: "Creating a Article"
	  fill_in "Body", with: "Article Body Lorem ipsum"

	  click_button "Create Article"

	  expect(page).to have_content("Article has been created Created")
		expect(page.current_path).to eq(articles_path) 

  end
end