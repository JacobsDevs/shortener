require 'rails_helper'

RSpec.describe 'customer new page' do
	it 'exists' do
		visit '/customers/new'
		
		expect(page).to have_content("Create new Customer")
	end
end