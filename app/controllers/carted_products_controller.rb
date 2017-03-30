class CartedProductsController < ApplicationController
	def index  
		@carted_products = current_user.carted_products.where(status: "carted")
			if @carted_products.empty? 
				redirect_to "/products"
			end	

	end 	

	def create 

		carted_product = CartedProduct.create(
			user_id: current_user.id, 
			product_id: params[:input_product_id], 
			quantity: params[:input_quantity], 
			status: "carted"
			)

		redirect_to "/carted_products"
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
