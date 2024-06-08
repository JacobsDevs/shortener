class CustomerController < ApplicationController
	def show
		@customer = Customer.find(params[:id])
	end
	def new
	end
end