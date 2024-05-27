class LinkController < ApplicationController
	def index
		@links = Link.all
	end

	def new
		render :new
	end

	def show
		@link = Link.find_by(shortlink: params[:shortlink])
		@link.update!(editing: false)
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

	def edit
		@link = Link.find_by(shortlink: params[:shortlink])
		@link.update!(editing: true)
	end

	def update
		@link = Link.find_by(shortlink: params[:original_shortlink])
		@links = Link.all

		if Link.find_by(shortlink: link_params[:shortlink])
			if params[:original_shortlink] != params[:shortlink]
				flash[:error] = "This shortlink is already taken!"
				redirect_to "/links"
				return
			end
		end

		if @link.editing
			@link.update!(link_params)
		else
			flash[:error] = "I don't think you should be doing that..."
			redirect_to "/links"
			return
		end

		redirect_to "/links/#{@link.shortlink}"
	end

	def redirect
		link = Link.find_by(shortlink: params[:shortlink])
		puts("Finding ip")
		puts("IP = #{request.remote_ip}")
		link.log_visit(request.remote_ip)
		if link.visit_count == nil
			link.update!(visit_count: 1)
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