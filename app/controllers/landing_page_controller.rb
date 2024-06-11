class LandingPageController < ApplicationController
	def new
	end

	def create
		LandingPage.create!(destination: params[:destination])
	end
end