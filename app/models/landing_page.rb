class LandingPage < ApplicationRecord
	has_many :fields

	def add_text_field
		fields.create!(name: "", field_type: "text", label: "", position: fields.size + 1)
	end

	def save_fields(params)
		update!(destination: params[:destination])
		fields.each_with_index do |field, i|
			field.update!(label: params["label_#{i}"], name: params["name_#{i}"])
		end
	end
end