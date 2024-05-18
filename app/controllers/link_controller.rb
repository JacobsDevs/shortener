class LinkController < ApplicationController
	def index
		@links = Link.all
	end

	def redirect
		link = Link.find_by(shortlink: params[:shortlink])
		if link.visit_count == nil
			link.update!(visit_count: 0)
		else
			link.update!(visit_count: (link.visit_count + 1))
		end

		redirect_to(link.link, allow_other_host: true)
	end
end