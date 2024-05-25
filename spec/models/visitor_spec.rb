require "rails_helper"

RSpec.describe Visitor, type: :model do
	describe "relationships" do
		it { should have_many :link_visits}
		it { should have_many(:links).through(:link_visits)}
	end
end