class CartedProductsController < ApplicationController
	before_action :authenticate_user!

	def index  
		@carted_products = current_user.carted_products.where(status: "carted")
			if @carted_products.empty? 
				redirect_to "/products"
			end	

	end 	

	def create 

		carted_product = CartedProduct.new(
			user_id: current_user.id, 
			product_id: params[:input_product_id], 
			quantity: params[:input_quantity], 
			status: "carted"
			)

		if carted_product.save 
			flash[:success] = "Product added to cart!"
			redirect_to "/products"
		else 
			flash[:danger] ="Product could not be added to cart!"
			redirect_to "/carted_products"
		end 
	end 

	def destroy 
		carted_product_id = params[:id]
		@carted_product = CartedProduct.find_by(id: carted_product_id)
		@carted_product.status = "removed"
		@carted_product.save 

		flash[:danger] = "Product deleted!"
		redirect_to "/products"


	end 
end
