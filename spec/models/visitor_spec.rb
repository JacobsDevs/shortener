require "rails_helper"

RSpec.describe Visitor, type: :model do
	describe "relationships" do
		it { should have_many :links_visitors}
		it { should have_many(:links).through(:links_visitors)}
	end
	describe "methods" do
	end
end