class LandingPageController < ApplicationController
	def new
		@landing_page = LandingPage.create!
	end

	def create
		landing_page = LandingPage.find(params[:id])
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
		@landing_page = LandingPage.find(params[:data]['id'])
		@landing_page.add_text_field
		render :new
	end
end