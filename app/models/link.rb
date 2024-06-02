class Link < ApplicationRecord
	has_many :links_visitors
	has_many :visitors, through: :links_visitors
	validates :shortlink, :link, presence: true

	def log_visit(ip_address)
		self.visit_count ? self.visit_count+=1 : self.visit_count = 1
		if self.visitors.where(ip_address: ip_address).size == 0
			a = self.visitors.create!(ip_address: ip_address)
			b = self.links_visitors.where(visitor_id: a.id).first
			b.visits = 1
			require 'pry'; binding.pry
		else
			self.links_visitors.where(visitor_id: a.id).first.visits += 1
		end
		self.save
	end
end