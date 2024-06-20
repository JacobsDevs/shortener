class LandingPageController < ApplicationController
	def new
		@landing_page = LandingPage.create!
	end

	def create
		landing_page = LandingPage.find(params[:id])
		if params[:commit] == "Add Text Field"
			add_text_field
		elsif params[:commit] == "Create Page"
			landing_page.save_fields(params)
			redirect_to "/landing_page/#{landing_page.id}"
		end
	end

	def show
		@landing_page = LandingPage.find(params[:id])
	end

	def form
		@landing_page = LandingPage.find(params[:id])
	end

	def submit
		customer = Customer.create!(name: params["Client Name"])

		redirect_to "/customers/#{customer.id}"
	end

	def add_text_field
		@landing_page = LandingPage.find(params[:id])
		@landing_page.save_fields(params)
		@landing_page.add_text_field
		render :new
	end
end