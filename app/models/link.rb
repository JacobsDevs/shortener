class Link < ApplicationRecord
	has_many :links_visitors
	has_many :visitors, through: :links_visitors
	validates :shortlink, :link, presence: true

	def log_visit(ip_address)
		self.visit_count ? self.visit_count+=1 : self.visit_count = 1
		if self.visitors.where(ip_address: ip_address).size == 0
			self.visitors.create!(ip_address: ip_address)
			self.save
		end
		a = self.visitors.find_by(ip_address: ip_address)
		b = self.links_visitors.find_by(visitor_id: a.id)
		b.increment!(:visits)
		b.save
	end
end