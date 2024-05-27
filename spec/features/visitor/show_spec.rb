require "rails_helper"

RSpec.describe "Visitor Show Page" do
	it "Has a Visitors page that shows it's Page Visits" do
		link = Link.create!(shortlink: "a", link: "http://www.google.com")
		visitor = Visitor.create!(ip_address: "192.168.0.1")
		linkvisit = LinksVisitor.create!(link_id: link.id, visitor_id: visitor.id)
		
		visit "/visitors/#{visitor.id}"
		
		expect(page).to have_content("IP: #{visitor.ip_address}")
		expect(page).to have_content("Visited Shortlink: #{link.shortlink}")
	end

	it "has the visitor's location" do
		visitor = Visitor.create!(ip_address: "159.196.225.5")

		visit "/visitors/#{visitor.id}"

		expect(page).to have_content("Location: Melbourne, AU")
	end
end