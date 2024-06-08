class CustomerController < ApplicationController
	def show
		@customer = Customer.find(params[:id])
	end
	def new
	end
	def create
		customer = Customer.create!(customer_params)

		redirect_to "/customers/#{customer.id}"
	end
	private
	def customer_params
		params.permit(:name, :email, :phone_number)
	end
end