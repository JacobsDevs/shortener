require "rails_helper"

RSpec.describe "Link Edit" do
	it "exists" do
		link = Link.create!(shortlink: "a", link: "http://www.google.com")

		visit "/links/edit/#{link.shortlink}"

	  expect(current_path).to have_content("edit/#{link.shortlink}")
		expect(page).to have_field("Shortlink", with: "#{link.shortlink}")
		expect(page).to have_field("Link", with: "#{link.link}")
	end

	it "can update Links" do
		link = Link.create!(shortlink: "a", link: "http://www.google.com")

		visit "/links/edit/#{link.shortlink}"

		fill_in "Link", with: "http://www.facebook.com"
		fill_in "Shortlink", with: "b"

		click_button "Update Link"

		expect(current_path).to have_content("/links/b")
		expect(page).to have_content("Link\nhttp://www.facebook.com")
	end
end