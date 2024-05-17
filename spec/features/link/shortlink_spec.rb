require 'rails_helper'

RSpec.describe "Shortlinks" do
	it "Can redirect a shortlink to a link" do
		link = Link.create!(shortlink: "abc", link: "http://www.google.com")

		visit "#{link.shortlink}"
		expect(current_path).to have_content("www.google.com")
	end
end