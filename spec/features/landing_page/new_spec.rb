require 'rails_helper'

RSpec.describe "Landing Page new page" do
	it "exists" do
		visit "/landing_page/new"

		expect(page).to have_content("New Landing Page")
	end
	it "asks for a definition by default" do
		visit "/landing_page/new"

		fill_in "Destination", with: "www.google.com"
		click_button "Create Page"

		expect(LandingPage.last.destination).to eq("www.google.com")
	end
end