class Visitor < ApplicationRecord
	has_many :links_visitors
	has_many :links, through: :links_visitors
end