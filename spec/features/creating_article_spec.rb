require 'rails_helper'

RSpec.feature "Creating Article" do
  scenario "User creates a new Article" do
	  visit "/"

	  click_link "New Article"

	  fill_in "Title", with: "Creating a Article"
	  fill_in "Body", with: "Article Body Lorem ipsum"

	  click_button "Create Article"

	  expect(page).to have_content("Article has been created")
		expect(page.current_path).to eq(articles_path) 

  end

	scenario "A user fails to create a new article" do 
		visit "/"

		click_link "New Article"

		fill_in "Title", with: "" 
		fill_in "Body", with: "" 

		click_button "Create Article"

		expect(page).to have_content("Article has not been created") 
		expect(page).to have_content("Title can't be blank") 
		expect(page).to have_content("Body can't be blank")
	end

end