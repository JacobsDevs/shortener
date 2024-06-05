require "rails_helper"

RSpec.describe "customer show page" do
	it "has customer details" do
		customer = Customer.create!(ip_address: "225.232.42.76", name: "Joe")

		visit "/customers/#{customer.id}"

		expect(page).to have_content("IP Address: #{customer.ip_address}")
		expect(page).to have_content("Name: #{customer.name}")
	end
end