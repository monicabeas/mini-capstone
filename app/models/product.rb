class Product < ApplicationRecord

	def sale_method 
		if price.to_i < 2
			p "Discount Item!"
		else 
			p "Everyday Value!!"
		end 
	end

	def tax 
		price.to_i * 0.1
	end 

	def total 
		price.to_i + tax
	end  
end
