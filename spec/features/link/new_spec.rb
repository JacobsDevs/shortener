require "rails_helper"

RSpec.describe "New Link Form" do
	it "exists" do
		visit "/links"

		click_button "New Link"
		save_and_open_page
		fill_in "Link", with: "pokemon.com"
		fill_in "Shortlink", with: "poke"

		click_button "Save Link"

		expect(current_path).to have_content("/links")
		expect(page).to have_content("Link: http://pokemon.com")
		expect(page).to have_content("Shortlink: http://www.example.com/poke")
	end
end