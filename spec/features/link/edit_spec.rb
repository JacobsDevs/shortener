require "rails_helper"

RSpec.describe "Link Edit" do
	it "exists" do
		link = Link.create!(shortlink: "a", link: "http://www.google.com")

		visit "/links/edit/#{link.shortlink}"
		save_and_open_page

	  expect(current_path).to have_content("edit/#{link.shortlink}")
		expect(page).to have_field("Shortlink", with: "#{link.shortlink}")
		expect(page).to have_field("Link", with: "#{link.link}")
	end
end