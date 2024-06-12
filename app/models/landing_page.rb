class LandingPage < ApplicationRecord
	has_many :fields

	def add_text_field
		fields.create!(name: "new_field_name", field_type: "text", label: "label")
	end
end