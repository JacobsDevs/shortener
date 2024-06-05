require 'rails_helper'

RSpec.describe Customer, type: :model do
	it "exitsts" do
		Customer.create!(ip_address: "159.168.2.3")
	end
	describe "relationships" do
	end
end