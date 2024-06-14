class Customer < ApplicationRecord
	serialize :custom_attribute_hash, coder: YAML, type: Hash

	def self.create_from_visitor(visitor)
		Customer.create!(ip_address: visitor.ip_address)
	end
end