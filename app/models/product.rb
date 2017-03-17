class Product < ApplicationRecord

	def sale_method 
		if price < 2
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
