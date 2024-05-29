class Link < ApplicationRecord
	has_many :links_visitors
	has_many :visitors, through: :links_visitors
	validates :shortlink, :link, presence: true

	def log_visit(ip_address)
		if self.visit_count == nil
			self.visit_count = 1
		else
			self.visit_count = visit_count + 1
		end
		self.visitors.create!(ip_address: ip_address)
		self.save
	end
end