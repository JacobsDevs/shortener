require 'rails_helper'

RSpec.describe LandingPage, type: :model do
	it 'exists' do
		landing_page = LandingPage.create!()
	end
	it 'can save progress' do
		landing_page = LandingPage.create!()
		landing_page.add_text_field
		expect(landing_page.fields.last.label).to eq("label")
		params = {
							"field_#{landing_page.fields.last.id}_label" => "New Label",
		}
		landing_page.save_fields(params)
		expect(landing_page.fields.last.label).to eq("New Label")
	end
end