class OrdersController < ApplicationController
	before_action :authenticate_user!

	def create
		
		@carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

		subtotal = 0 
		@carted_products.each do |carted_product|
			@product = Product.find_by(id: carted_product.product_id)
			subtotal += carted_product.quantity * @product.price
		end 
	
		tax = (subtotal * 0.1)
		total = (subtotal + tax)
		
		@order = Order.create(user_id: current_user.id,
			subtotal: subtotal,
			tax: tax,
			total: total
			)

		@carted_products.each do |carted_product|
			carted_product.status = "purchased"
			carted_product.order_id = @order.id
			carted_product.save
		end 

		redirect_to "/orders/#{@order.id}"

	end

	def show 
		@user = User.find_by(id: session[:user_id])
		@order = Order.find_by(id: params[:id])
		@order.carted_products 


	end 
end
