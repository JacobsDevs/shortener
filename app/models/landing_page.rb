class LandingPage < ApplicationRecord
	has_many :fields

	def add_text_field
		fields.create!(name: "new_field_name", field_type: "text", label: "label")
	end

	def save_fields(params)
		fields.each do |field|
			field.update!(label: params["field_#{field.id}_label"])
		end
	end
end