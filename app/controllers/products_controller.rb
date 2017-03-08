class ProductsController < ApplicationController

	def view_products 
		@products = Product.all 

		render 'view_products.html.erb'	
	end 
end
