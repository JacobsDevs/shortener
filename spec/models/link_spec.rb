require "rails_helper"

RSpec.describe Link, type: :model do
	describe "validations" do
		it { should validate_presence_of(:shortlink) }
		it { should validate_presence_of(:link) }
	end
	it "can log_visit" do
		link = Link.create!(shortlink: 'a', link: 'http://www.google.com')
		ip = '127.0.0.1'
		
		link.log_visit(ip)

		expect(link.visitors.size).to eq(1)
		expect(link.visitors[0].ip_address).to eq("127.0.0.1")
	end
	it "can log visitor repeat visits" do
		link = Link.create!(shortlink: 'a', link: 'http://www.google.com')
		ip = '159.196.225.5'

		link.log_visit(ip)

		expect(link.visitors.size).to eq(1)
		expect(link.links_visitors[0].visits).to eq(1)
		
		link.log_visit(ip)

		expect(link.visitors.size).to eq(1)
		expect(link.links_visitors[0].visits).to eq(2)
	end
end