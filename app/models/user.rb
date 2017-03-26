class User < ApplicationRecord
	has_many :products
	has_many :orders

	has_secure_password

end
