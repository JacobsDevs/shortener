class LinkController < ApplicationController
	def redirect
		link = Link.find_by shortlink: params[:shortlink]

		redirect_to(link.link, allow_other_host: true)
	end
end