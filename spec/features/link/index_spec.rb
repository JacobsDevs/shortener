require "rails_helper"

RSpec.describe "Link Index" do
	it "displays all the links" do
		link1 = Link.create!(shortlink: "1a", link: "http://instagram.com")
		link2 = Link.create!(shortlink: "be", link: "http://kogan.com")

		visit "/"

		expect(page).to have_content("Shortlink: 127.0.0.1:3000/#{link1.shortlink}")
		
	end
end