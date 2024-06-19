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
		save_and_open_page
		click_button "Add Text Field"
		click_button "Add Text Field"

		expect(page).to have_content("New Landing Page")
		expect(page).to have_selector("input#label_1")

		click_button "Create Page"
	end
	it "saves fields contents when adding additional fields" do
		visit "/landing_page/new"

		click_button "Add Text Field"
		fill_in "label_0", with: "Change"
		save_and_open_page
		click_button "Add Text Field"
		expect(page).to have_selector('#label_0', text: "Change", wait: 100)
	end
end