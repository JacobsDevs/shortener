class Link < ApplicationRecord
	has_many :links_visitors
	has_many :visitors, through: :links_visitors
	validates :shortlink, :link, presence: true
end