require "rails_helper"

RSpec.describe Link, type: :model do
	describe "validations" do
		it { should validate_presence_of(:shortlink) }
		it { should validate_presence_of(:link) }
	end
	it "can log_visit" do
		link = Link.create!(shortlink: "a", link: "http://www.google.com")
		ip = "127.0.0.1"
		
		link.log_visit(ip)

		expect(link.visitors.size).to eq(1)
		expect(link.visitors[0].ip_address).to eq("127.0.0.1")
	end
end