require 'rails_helper'

RSpec.describe 'customer new page' do
	it 'exists' do
		visit '/customers/new'
		
		expect(page).to have_content("Create new Customer")
	end
	it 'has a form to fill in customer details' do
		visit '/customers/new'

		fill_in 'Name', with: 'Client McGuy'
		fill_in 'Email', with: 'client@test.com'
		fill_in 'Phone number', with: '0400 000 000'

		click_button 'Save Customer'

		expect(current_path).to have_content("/customers/#{Customer.last.id}")
	end
end