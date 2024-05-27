class Visitor < ApplicationRecord
	has_many :links_visitors
	has_many :links, through: :links_visitors

	after_create :init
	
	private
	def init
		results = Geocoder.search(ip_address)

		self.country = results.first.country
		self.city = results.first.city
		self.save
	end
end