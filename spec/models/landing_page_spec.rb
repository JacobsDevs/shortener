require 'rails_helper'

RSpec.describe LandingPage, type: :model do
	it 'exists' do
		landing_page = LandingPage.create!()
	end
end