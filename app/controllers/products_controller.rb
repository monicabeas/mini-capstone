class ProductsController < ApplicationController

	def index 
		@products = Product.all 

		render 'index.html.erb'	
	end 

	def show 
		product_id = params[:id]
		@product = Product.find_by(id: product_id)

	end 

	def new 
	end 

	def create 
		input_name = params[:name]
		input_price = params[:price]
		input_description = params[:description]

		@product = Product.create(name: input_name, price: input_price, description: input_description)

	end 
		
	def edit 
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end 

	def update 
		input_name = params[:name]
		input_price = params[:price]
		input_description = params[:description]

		@product = Product.find_by(id: params[:id])
		@product.name = input_name
		@product.price = input_price
		@product.description = input_description
		@product.save 

		redirect_to "/products/#{@product.id}"
	end 

	def destroy
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
		@product.destroy

		redirect_to "/products"

	end 

	




	def enter_product 

	end 

	def show_product 
		input_name = params[:name]
		input_price = params[:price]
		input_description = params[:description]

		@product = Product.create(name: input_name, price: input_price, description: input_description)

	end 
end
