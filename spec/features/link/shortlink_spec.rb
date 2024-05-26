require 'rails_helper'

RSpec.describe "Shortlinks" do
	it "Can redirect a shortlink to a link" do
		link = Link.create!(shortlink: "abc", link: "http://www.google.com")

		visit "#{link.shortlink}"
	end
	it "Can count visits" do
		link = Link.create!(shortlink: "abc", link: "http://www.google.com")

		visit "#{link.shortlink}"
	end
	it "Logs a visitor and grabs their IP" do
		link = Link.create!(shortlink: "abc", link: "http://www.google.com")

		visit "#{link.shortlink}"
		visit "/links/#{link.shortlink}"

		expect(page).to have_content("Visitor: 127.0.0.1")
	end
end