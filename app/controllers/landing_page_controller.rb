class LandingPageController < ApplicationController
	def new
	end

	def create
		a = LandingPage.create!(destination: params[:destination])
	end

	def add_text_field
	end
end