class LandingPageController < ApplicationController
	def new
		@landing_page = LandingPage.create!
	end

	def create
		landing_page = LandingPage.find(params[:id])
	end

	def add_text_field
		@landing_page = LandingPage.find(params[:data]['id'])
		@landing_page.add_text_field
		render :new
	end
end