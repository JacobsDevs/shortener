class VisitorController < ApplicationController
	def show
		@visitor = Visitor.find(params[:id])
	end
end