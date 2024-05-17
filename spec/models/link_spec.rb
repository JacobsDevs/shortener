require "rails_helper"

RSpec.describe Link, type: :model do
	describe "validations" do
		it { should validate_presence_of(:shortlink) }
		it { should validate_presence_of(:link) }
	end
end