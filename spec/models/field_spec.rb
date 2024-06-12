require 'rails_helper'

RSpec.describe Field, type: :model do
	it 'exists' do
		page = LandingPage.create!
		page.fields.create!
	end
end