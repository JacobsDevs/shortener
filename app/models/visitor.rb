require "geocoder"

class Visitor < ApplicationRecord
	has_many :links_visitors
	has_many :links, through: :links_visitors

	after_create :init
	
	private
	def init
		results = Geocoder.search(ip_address)
		puts(results.first)
		self.update!(country: results.first.country)
		self.update!(city: results.first.city)
	end
end