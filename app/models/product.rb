class Product < ApplicationRecord
	belongs_to :supplier
	#def supplier 
		#Supplier.find_by(id: supplier_id)
	#end 

	has_many :images
	has_many :categories, through: :categorized_products
	has_many :categorized_products
	has_many :carted_products 
	has_many :orders, through: :carted_products

	def sale_method 
		if price < 50
			p "Discounted Item!"
		else 
			p "Everyday Value!!"
		end 
	end

	def tax 
		price * 0.1
	end 

	def total 
		price + tax
	end  

end
