class LinkController < ApplicationController
	def index
		@links = Link.all
	end

	def new
		render :new
	end

	def create
		if params[:link].start_with?("http://")
			Link.create!(link_params)
		else
			params[:link] = "http://#{params[:link]}"
			Link.create!(link_params)
		end
		redirect_to "/links"
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

	private
	def link_params
		params.permit(:shortlink, :link)
	end
end