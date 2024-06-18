require "rails_helper"

RSpec.describe "Landing Page Form" do
	it "Exists" do
		pages = LandingPage.create!(destination: "www.google.com")
		pages.add_text_field
		pages.fields.last.update!(label: "Name", name: "Client Name")

		visit "/landing_page/#{pages.id}"
		fill_in "Client Name", with: "John"
		
		click_button "Submit"
		save_and_open_page
		expect(current_path).to have_content("/customers")
		expect(page).to have_content("Client Name: John")
	end
end