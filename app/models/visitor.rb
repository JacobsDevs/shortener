class Visitor < ApplicationRecord
	has_many :links_visitors
	has_many :links, through: :links_visitors

	after_create :init
	
	def is_customer?
		if Customer.find_by!(ip_address: self.ip_address)
			return true
		else
			return false
		end
	end
	
	private
	def init
		results = Geocoder.search(ip_address)

		self.country = results.first.country
		self.city = results.first.city
		self.save
	end
end