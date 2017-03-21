class SuppliersController < ApplicationController

	def index
		@suppliers = Supplier.all 

		render 'index.html.erb'
	end 

	def show 
		@supplier = Supplier.find_by(id: params[:id])
		

	end 

	def new 

	end 

	def create 
		input_name = params[:name]
		input_email = params[:email]
		input_phone = params[:phone_number]

		@supplier = Supplier.create(name: input_name, email: input_email, phone_number: input_phone)
	end 

	def edit 
		@supplier = Supplier.find_by(id: params[:id])
	end 

	def update 
		input_name = params[:name]
		input_email = params[:email]
		input_phone = params[:phone_number]

		@supplier = Supplier.find_by(id: params[:id])
		@supplier.name = input_name
		@supplier.email = input_email
		@supplier.phone_number = input_phone
		@supplier.save 

		redirect_to "/suppliers/#{@supplier.id}"
		
	end 

	def destroy 
		@supplier = Supplier.find_by(id: params[:id])
		@supplier.destroy

		redirect_to "/suppliers"
	end 

end
