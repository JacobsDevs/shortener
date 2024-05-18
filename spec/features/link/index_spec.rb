require "rails_helper"

RSpec.describe "Link Index" do
	it "displays all the shortlinks" do
		link1 = Link.create!(shortlink: "1a", link: "http://instagram.com")
		link2 = Link.create!(shortlink: "be", link: "http://kogan.com")

		visit "/links"

		expect(page).to have_content("Shortlink: http://www.example.com/#{link1.shortlink}")
	end
	it "displays all the long links" do
		link1 = Link.create!(shortlink: "1a", link: "http://instagram.com")
		link2 = Link.create!(shortlink: "be", link: "http://kogan.com")

		visit "/links"

		expect(page).to have_content("Link: #{link1.link}")
	end
end