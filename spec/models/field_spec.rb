require 'rails_helper'

RSpec.describe Field, type: :model do
	it 'exists' do
		page = LandingPage.create!
		page.fields.create!
	end
	it 'has an order' do
		page = LandingPage.create!
		a = page.add_text_field
		b = page.add_text_field
		c = page.add_text_field
		expect(a.position).to eq(1)
		expect(b.position).to eq(2)
		expect(c.position).to eq(3)
	end
end