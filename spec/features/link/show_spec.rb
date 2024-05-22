require "rails_helper"

RSpec.describe "Link Show Page" do
	it "Shows stats of link" do
		link = Link.create!(link: "http://www.facebook.com", shortlink: "face")

		visit "/links/#{link.shortlink}"

		expect(page).to have_content("Link: #{link.link}")
		expect(page).to have_content("Shortlink: #{link.shortlink}")
	end

	it "Shows Visits" do
		link = Link.create!(link: "http://www.facebook.com", shortlink: "face", visit_count: 4)

		visit "/links/#{link.shortlink}"

		expect(page).to have_content("Visit Count: #{link.visit_count}")
	end
end