class Product < ApplicationRecord

	belongs_to :supplier
	
	#def supplier 
		#Supplier.find_by(id: supplier_id)
	#end 

	has_many :images

	def sale_method 
		if price < 50
			p "Discount Item!"
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
