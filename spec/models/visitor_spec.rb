require "rails_helper"

RSpec.describe Visitor, type: :model do
	describe "relationships" do
		it { should have_many :links_visitors}
		it { should have_many(:links).through(:links_visitors)}
	end
	describe "methods" do
		it "can detect is_customer?" do
			visitor = Visitor.create!(ip_address: "211.122.2.54")
			customer = Customer.create_from_visitor(visitor)

			expect(visitor.is_customer?).to eq(true)
		end
	end
end