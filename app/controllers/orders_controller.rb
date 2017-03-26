class OrdersController < ApplicationController

	def create
		@product = Product.find_by(id: params[:input_product_id])

		quantity = params[:input_quantity]
		subtotal = quantity.to_i * @product.price
		tax = (subtotal * 0.1)
		total = (subtotal + tax)
		
		order = Order.create(user_id: current_user.id,
			product_id: params[:input_product_id],
			quantity: params[:input_quantity],
			subtotal: subtotal,
			tax: tax,
			total: total
			
			)

		redirect_to "/orders/#{order.id}"

	end

	def show 
		@user = User.find_by(id: session[:user_id])
		@order = Order.find_by(id: params[:id])
		@product = Product.find_by(id: @order.product_id)


	end 
end
