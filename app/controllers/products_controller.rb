class ProductsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show, :search]
	before_action :authenticate_admin!, except: [:index, :show, :search]

	def index 
		sort = params[:sort]
		sort_order = params[:sort_order]
		discount = params[:discount]

		if discount
			@products = Product.where("price < ?", 50)
		elsif sort && sort_order
			@products = Product.all.order(sort => sort_order)
		else 
			@products = Product.all 
		end 

		category_id = params[:category_id]
		if category_id
			@category = Category.find_by(id: category_id)
			@products = @category.products
		else
			@products = Product.all 
		end 

		render 'index.html.erb'	
	end 

	def show 

		if params[:id] =="random"
			# Select random recipe from the database
			products = Product.all 
			@product = products.sample 
		else 
			product_id = params[:id]
			@product = Product.find_by(id: product_id)
			@categories = @product.categories
		end 
	end 

	def search 
		search_term = params[:search_term]
		@products = Product.where("name ILIKE ?", "%#{search_term}%")
		render :index
	end 

	def new 
		@product = Product.new
	end 

	def create 
		input_name = params[:name]
		input_price = params[:price]
		input_description = params[:description]
		input_stock = params[:stock]

		@product = Product.new(name: input_name, price: input_price, description: input_description, 
			stock: input_stock)

		if @product.save
			flash[:success] = "Product created!"
			redirect_to "/products/#{@product.id}"
		else 
			flash[:danger] ="Product could not be created!"
			render "new.html.erb"
		end 
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

		flash[:info] = "Product updated successfully!"
		redirect_to "/products/#{@product.id}"
	end 

	def destroy
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
		@product.destroy

		flash[:danger] = "Product destroyed!"
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
