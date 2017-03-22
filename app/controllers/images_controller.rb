class ImagesController < ApplicationController
	def new 
		@product = Product.find_by(id: params[:product_id])
	end 

	def create 
		@product = Product.find_by(id: params[:product_id])
		input_pic = params[:image_pic]

		Image.create(image: input_pic, product_id: @product.id)

		redirect_to "/products/#{@product.id}"
	end 

end
