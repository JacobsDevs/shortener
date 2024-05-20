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
end