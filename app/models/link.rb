class Link < ApplicationRecord
	validates :shortlink, :link, presence: true
end