require 'rails_helper'

RSpec.describe "Landing Page new page" do
	it "exists" do
		visit "/landing_page/new"

		expect(page).to have_content("New Landing Page")
	end
	it "asks for a destination by default" do
		visit "/landing_page/new"

		fill_in "Destination", with: "www.google.com"
		click_button "Create Page"

		expect(LandingPage.last.destination).to eq("www.google.com")
	end
	it "can add fields to the landing page" do
		visit "/landing_page/new"
		
		click_button "Add Text Field"
		expect(page).to have_content("New Landing Page")
		expect(page).to have_selector("input#new_field_name")
	end
end