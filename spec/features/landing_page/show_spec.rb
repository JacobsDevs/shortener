require "rails_helper"

RSpec.describe "Landing Page Show" do
	it "Shows the landing page details" do
		landing = LandingPage.create!(destination: "www.google.com")
		landing.add_text_field

		visit "/landing_page/#{landing.id}"
		
		expect(page).to have_content("Destination: #{landing.destination}")
		expect(page).to have_content("label: new_field_name")
	end
end