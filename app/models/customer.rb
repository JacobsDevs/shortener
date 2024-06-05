class Customer < ApplicationRecord
	def self.create_from_visitor(visitor)
		Customer.create!(ip_address: visitor.ip_address)
	end
end