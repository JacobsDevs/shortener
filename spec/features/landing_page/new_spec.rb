require 'rails_helper'

RSpec.describe "Landing Page new page" do
	it "exists" do
		visit "/landing_page/new"

		expect(page).to have_content("New Landing Page")
	end
end