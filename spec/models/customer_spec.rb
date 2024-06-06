require 'rails_helper'

RSpec.describe Customer, type: :model do
	it "exitsts" do
		Customer.create!(ip_address: "159.168.2.3")
	end
	describe "relationships" do
	end
	describe "methods" do
		it "can create_from_visitor" do
			visitor = Visitor.create!(ip_address: "159.162.22.3")
			customer = Customer.create_from_visitor(visitor)
			
			require 'pry'; binding.pry
			expect(customer.ip_address).to eq(visitor.ip_address)
		end
	end
end