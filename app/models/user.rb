class User < ApplicationRecord
	has_many :products, through: :carted_products
	has_many :orders, through: :carted_products
	has_many :carted_products 

	has_secure_password

end
